function [PL , APD , MPD , TT] = Simulator2(lambda,C,f,P,b)
% INPUT PARAMETERS:
%  lambda - packet rate (packets/sec)
%  C      - link bandwidth (Mbps)
%  f      - queue size (Bytes)
%  b      - bit error rate (BER)
%  P      - number of correctly transmitted packets (stopping criterium)
% OUTPUT PARAMETERS:
%  PL   - packet loss (%)
%  APD  - average packet delay (milliseconds)
%  MPD  - maximum packet delay (milliseconds)
%  TT   - transmitted throughput (Mbps)

%Events:
ARRIVAL= 0;       % Arrival of a packet            
DEPARTURE= 1;     % Departure of a packet

%State variables:
STATE = 0;          % 0 - connection is free; 1 - connection is occupied
QUEUEOCCUPATION= 0; % Occupation of the queue (in Bytes)
QUEUE= [];          % Size and arriving time instant of each packet in the queue

%Statistical Counters:
TOTALPACKETS= 0;     % No. of packets arrived to the system
LOSTPACKETS= 0;      % No. of packets dropped due to buffer overflow
TRANSPACKETS= 0;     % No. of transmitted packets
TRANSBYTES= 0;       % Sum of the Bytes of transmitted packets
DELAYS= 0;           % Sum of the delays of transmitted packets
MAXDELAY= 0;         % Maximum delay among all transmitted packets
LOSTPACKETS_BER = 0; % No. of packets dropped due to BER

% Initializing the simulation clock:
Clock= 0;

% Initializing the List of Events with the first ARRIVAL:
tmp= Clock + exprnd(1/lambda);
Event_List = [ARRIVAL, tmp, GenerateDataPacketSize(), tmp];

%Similation loop:
while TRANSPACKETS<P                     % Stopping criterium
    Event_List= sortrows(Event_List,2);  % Order EventList by time
    Event= Event_List(1,1);                 % Get first event 
    Clock= Event_List(1,2);                 %    and all
    PacketSize= Event_List(1,3);            %    associated
    ArrInstant= Event_List(1,4);            %    parameters.
    Event_List(1,:)= [];                 % Eliminate first event
    switch Event
        case ARRIVAL         % If first event is an ARRIVAL
            TOTALPACKETS= TOTALPACKETS+1;
            tmp= Clock + exprnd(1/lambda);
            Event_List = [Event_List; ARRIVAL, tmp, GenerateDataPacketSize(), tmp];
            if STATE==0
                STATE= 1;
                Event_List = [Event_List; DEPARTURE, Clock + 8*PacketSize/(C*1e6), PacketSize, Clock];
            else
                if QUEUEOCCUPATION + PacketSize <= f
                    QUEUE= [QUEUE;PacketSize , Clock];
                    QUEUEOCCUPATION= QUEUEOCCUPATION + PacketSize;
                else
                    LOSTPACKETS= LOSTPACKETS + 1;
                end
            end
        case DEPARTURE          % If first event is a DEPARTURE

            % 1. CÁLCULO DA PROBABILIDADE DE SUCESSO
            % N = número de bits. 1 Byte = 8 bits.
            N = 8 * PacketSize; 
            % P(Sucesso) = P(Sem Erros) = (1 - BER)^N
            P_success = (1 - b)^N;

            if rand() <= P_success
                %Pacote transmitido corretamente
                TRANSBYTES= TRANSBYTES + PacketSize;
                DELAYS= DELAYS + (Clock - ArrInstant);
                if Clock - ArrInstant > MAXDELAY
                    MAXDELAY= Clock - ArrInstant;
                end
                TRANSPACKETS= TRANSPACKETS + 1;
            else 
                % PACOTE RECEBIDO COM ERROS (PERDIDO POR BER)
                LOSTPACKETS_BER = LOSTPACKETS_BER + 1;
            end

            if QUEUEOCCUPATION > 0
                QSize= QUEUE(1,1);
                QInstant= QUEUE(1,2);
                Event_List = [Event_List; DEPARTURE, Clock + 8*QSize/(C*1e6), QSize, QInstant];
                QUEUEOCCUPATION= QUEUEOCCUPATION - QSize;
                QUEUE(1,:)= [];
            else
                STATE= 0;
            end
    end
end

%Performance parameters determination:
PL= 100*(LOSTPACKETS + LOSTPACKETS_BER)/TOTALPACKETS;  % in percentage
APD= 1000*DELAYS/TRANSPACKETS;     % in milliseconds
MPD= 1000*MAXDELAY;                % in milliseconds
TT= 1e-6*TRANSBYTES*8/Clock;       % in Mbps

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