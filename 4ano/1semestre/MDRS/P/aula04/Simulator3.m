% Nova linha para Simulator3.m
function [PL_data, PL_VoIP, APD_data, APD_VoIP, MPD_data, MPD_VoIP, TT] = Simulator3(lambda, C, f, P, n)
% INPUT PARAMETERS:
%  lambda - packet rate (packets/sec)
%  C      - link bandwidth (Mbps)
%  f      - queue size (Bytes)
%  P      - number of packets (stopping criterium)
% OUTPUT PARAMETERS:
%  PL   - packet loss (%)
%  APD  - average packet delay (milliseconds)
%  MPD  - maximum packet delay (milliseconds)
%  TT   - transmitted throughput (Mbps)

% Packet Types (adicionar esta secção)
DATA = 1;
VOIP = 2;

%Events:
ARRIVAL= 0;       % Arrival of a packet            
DEPARTURE= 1;     % Departure of a packet

%State variables:
STATE = 0;          % 0 - connection is free; 1 - connection is occupied
QUEUEOCCUPATION= 0; % Occupation of the queue (in Bytes)
QUEUE= [];          % Size and arriving time instant of each packet in the queue


% Contadores para pacotes de DADOS
TOTALPACKETS_data = 0; % No. of data packets arrived to the system
LOSTPACKETS_data = 0; % No. of data packets dropped due to buffer overflow
TRANSPACKETS_data = 0; % No. of transmitted data packets
DELAYS_data = 0; % Sum of the delays of transmitted data packets
MAXDELAY_data = 0; % Maximum delay among all transmitted data packets

% Contadores para pacotes VoIP
TOTALPACKETS_VoIP = 0; % No. of voip packets arrived to the system
LOSTPACKETS_VoIP = 0; % No. of voip packets dropped due to buffer overflow
TRANSPACKETS_VoIP = 0; % No. of transmitted voip packets
DELAYS_VoIP = 0; % Sum of the delays of transmitted voip packets
MAXDELAY_VoIP = 0; % Maximum delay among all transmitted voip packets


% Contador global para o throughput total
TRANSBYTES= 0;

% Initializing the simulation clock:
Clock= 0;

Event_List = []; % Começar com a lista vazia

% Agendar a primeira chegada de DADOS
tmp= Clock + exprnd(1/lambda);
Event_List = [Event_List; ARRIVAL, tmp, GenerateDataPacketSize(), tmp, DATA];

% Agendar a primeira chegada de cada um dos n fluxos VoIP
for i = 1:n
    % A primeira chegada é uniforme entre 0 e 20 ms
    tmp = Clock + (rand() * 20e-3); 
    Event_List = [Event_List; ARRIVAL, tmp, randi([110, 130]), tmp, VOIP];
end

%Similation loop:
while TOTALPACKETS_data + TOTALPACKETS_VoIP<P                     % Stopping criterium
    Event_List= sortrows(Event_List,2);  % Order EventList by time
    Event= Event_List(1,1);                 % Get first event 
    Clock= Event_List(1,2);                 %    and all
    PacketSize= Event_List(1,3);            %    associated
    ArrInstant= Event_List(1,4);            %    parameters.
    PacketType= Event_List(1,5);            %    Tipo de pacote
    Event_List(1,:)= [];                 % Eliminate first event
    switch Event
        case ARRIVAL         % If first event is an ARRIVAL
            if PacketType == DATA
                TOTALPACKETS_data = TOTALPACKETS_data + 1;
                tmp= Clock + exprnd(1/lambda);
                Event_List = [Event_List; ARRIVAL, tmp, GenerateDataPacketSize(), tmp, DATA];
            else % é um pacote VoIP
                TOTALPACKETS_VoIP = TOTALPACKETS_VoIP + 1;
                % O tempo entre chegadas VoIP é uniforme entre 16ms e 24ms
                tmp = Clock + 16e-3 + (24e-3 - 16e-3) * rand();
                Event_List = [Event_List; ARRIVAL, tmp, randi([110, 130]), tmp, VOIP];
            end

            if STATE==0
                STATE= 1;
                % Passar o tipo de pacote para o evento DEPARTURE
                Event_List = [Event_List; DEPARTURE, Clock + 8*PacketSize/(C*1e6), PacketSize, ArrInstant, PacketType];
            else
                if QUEUEOCCUPATION + PacketSize <= f
                    % Adicionar o tipo de pacote à fila
                    QUEUE= [QUEUE; PacketSize, ArrInstant, PacketType];
                    QUEUEOCCUPATION= QUEUEOCCUPATION + PacketSize;
                else
                    % Atualizar o contador de perdas do tipo correto
                    if PacketType == DATA
                        LOSTPACKETS_data = LOSTPACKETS_data + 1;
                    else % VOIP
                        LOSTPACKETS_VoIP = LOSTPACKETS_VoIP + 1;
                    end
                end
            end


        case DEPARTURE
            TRANSBYTES = TRANSBYTES + PacketSize;
            delay = Clock - ArrInstant;
        
            % contadores estatísticos com base no tipo de pacote
            if PacketType == DATA
                DELAYS_data = DELAYS_data + delay;
                if delay > MAXDELAY_data
                    MAXDELAY_data = delay;
                end
                TRANSPACKETS_data = TRANSPACKETS_data + 1;
            else % VOIP
                DELAYS_VoIP = DELAYS_VoIP + delay;
                if delay > MAXDELAY_VoIP
                    MAXDELAY_VoIP = delay;
                end
                TRANSPACKETS_VoIP = TRANSPACKETS_VoIP + 1;
            end
            
            % Tirar o proximo pacote da fila (FIFO)
            if QUEUEOCCUPATION > 0
                QSize= QUEUE(1,1);
                QInstant= QUEUE(1,2);
                QType= QUEUE(1,3); % Obter o tipo do pacote da fila
                % Agendar a sua partida, passando o seu tipo
                Event_List = [Event_List; DEPARTURE, Clock + 8*QSize/(C*1e6), QSize, QInstant, QType];
                QUEUEOCCUPATION= QUEUEOCCUPATION - QSize;
                QUEUE(1,:)= [];
            else
                STATE= 0;
            end
    end
end

%Performance parameters determination:


% Perda de Pacotes (%)
PL_data = 100 * LOSTPACKETS_data / TOTALPACKETS_data;
if n > 0
    PL_VoIP = 100 * LOSTPACKETS_VoIP / TOTALPACKETS_VoIP;
else
    PL_VoIP = 0; % Evitar divisão por zero se não houver pacotes VoIP
end

% Atraso Médio de Pacote (ms)
APD_data = 1000 * DELAYS_data / TRANSPACKETS_data;
if n > 0
    APD_VoIP = 1000 * DELAYS_VoIP / TRANSPACKETS_VoIP;
else
    APD_VoIP = 0;
end

% Atraso Máximo de Pacote (ms)
MPD_data = 1000 * MAXDELAY_data;
MPD_VoIP = 1000 * MAXDELAY_VoIP;

% Débito Transmitido Total (Mbps)
TT = 1e-6 * TRANSBYTES * 8 / Clock;

end

function out= GenerateDataPacketSize()
    aux= rand();
    aux2= [65:109 111:1517];
    if aux <= 0.19
        out= 64;
    elseif aux <= 0.19 + 0.23
        out= 110;
    elseif aux <= 0.19 + 0.23 + 0.17
        out= 1518;
    else
        out = aux2(randi(length(aux2)));
    end
end

