Foi 4 perguntas de escolha múltipla literalmente sobre AC2 com espaco de endereçamento e gamas de representação

Depois o stor fornece um datasheet , no ano passado foi tc74 este ano deve ser BME , depois é uma pergunta em que o stor de dá a descrição de um sistema que el quer , com componentes tipo SD card , esp , ventoinha e BME e tens de desenhar lá o esquema com as entradas ,saidas  e ligações entre cada um , depois é uma pergunta sobre uma funcao especifica do BME , no ano passado tinha sido sobre o tc74 que senão me engano era sobre a readaftertemp que a tinhas de explicar

Depois 5 perguntas onde tinhas de completar 5 funcoes que no ano passado eram sobre o tc74 , ou seja o stor tinha pedido dos exemplos que ele deu do tc74 escrevesses as funcoes que ele te pedia , ja nao me lembro ao certo quais especificas mas basicamente é mm decorar as funcoes dos BME que acho que é o que vai calhar este ano

Os topicos que precisas mais sao :
-saber fazer esquema elétrico e saber distinguir SPI de I2C nas ligações 
-saber o que faz cada função do bme (acho que é o que calha)
-saber escrever essas funções detalhadamente como o stor tem

o stor no ano passado pediu estas funções:

``
void tc74_wakeup(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t buffer[2] = {TC74_COMMAND_RWCR, 0x00};
    
    ESP_ERROR_CHECK(i2c_master_transmit(sensorHandle, buffer, sizeof(buffer), -1));
}

bool tc74_is_temperature_ready(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t command = TC74_COMMAND_RWCR;
    uint8_t cnfgReg;
    
    ESP_ERROR_CHECK(i2c_master_transmit_receive(sensorHandle, &command, sizeof(command),
                                                &cnfgReg, sizeof(cnfgReg), -1));
    return (cnfgReg & TC74_READY_MASK);
}

void tc74_wakeup_and_read_temp(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp)
{
    tc74_wakeup(sensorHandle);
    while (!tc74_is_temperature_ready(sensorHandle));
    tc74_read_temp_after_cfg(sensorHandle, pTemp);
}

void tc74_read_temp_after_cfg(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp)
{
    uint8_t command = TC74_COMMAND_RTR;
    
    ESP_ERROR_CHECK(i2c_master_transmit_receive(sensorHandle, &command, sizeof(command),
                                                pTemp, sizeof(*pTemp), -1));
}

void tc74_read_temp_after_temp(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp)
{
    ESP_ERROR_CHECK(i2c_master_receive(sensorHandle, pTemp, sizeof(*pTemp), -1));
}
```

Qual é o intervalo de endereçamento de um sistema com 16 bits de endereçamento?


o stor metia te isto: ```bool tc74_is_temperature_ready(i2c_master_dev_handle_t sensorHandle)```

e tinhas de completar
