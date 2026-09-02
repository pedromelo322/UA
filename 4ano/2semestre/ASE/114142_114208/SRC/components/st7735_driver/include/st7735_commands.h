#pragma once

// ST7735 Command Definitions
#define ST7735_NOP       0x00
#define ST7735_SWRESET   0x01  // Software Reset
#define ST7735_RDDID     0x04  // Read Display ID
#define ST7735_RDDST     0x09  // Read Display Status

#define ST7735_SLPIN     0x10  // Sleep In
#define ST7735_SLPOUT    0x11  // Sleep Out
#define ST7735_PTLON     0x12  // Partial Mode On
#define ST7735_NORON     0x13  // Normal Display Mode On

#define ST7735_INVOFF    0x20  // Display Inversion Off
#define ST7735_INVON     0x21  // Display Inversion On
#define ST7735_GAMSET    0x26  // Gamma Set
#define ST7735_DISPOFF   0x28  // Display Off
#define ST7735_DISPON    0x29  // Display On

#define ST7735_CASET     0x2A  // Column Address Set
#define ST7735_RASET     0x2B  // Row Address Set
#define ST7735_RAMWR     0x2C  // Memory Write
#define ST7735_RAMRD     0x2E  // Memory Read

#define ST7735_PTLAR     0x30  // Partial Area
#define ST7735_TEOFF     0x34  // Tearing Effect Line Off
#define ST7735_TEON      0x35  // Tearing Effect Line On
#define ST7735_MADCTL    0x36  // Memory Data Access Control
#define ST7735_IDMOFF    0x38  // Idle Mode Off
#define ST7735_IDMON     0x39  // Idle Mode On
#define ST7735_COLMOD    0x3A  // Interface Pixel Format

#define ST7735_RDID1     0xDA  // Read ID1
#define ST7735_RDID2     0xDB  // Read ID2
#define ST7735_RDID3     0xDC  // Read ID3

// Frame Rate Control
#define ST7735_FRMCTR1   0xB1  // Frame Rate Control (Normal Mode)
#define ST7735_FRMCTR2   0xB2  // Frame Rate Control (Idle Mode)
#define ST7735_FRMCTR3   0xB3  // Frame Rate Control (Partial Mode)

// Power Control
#define ST7735_INVCTR    0xB4  // Display Inversion Control
#define ST7735_PWCTR1    0xC0  // Power Control 1
#define ST7735_PWCTR2    0xC1  // Power Control 2
#define ST7735_PWCTR3    0xC2  // Power Control 3
#define ST7735_PWCTR4    0xC3  // Power Control 4
#define ST7735_PWCTR5    0xC4  // Power Control 5
#define ST7735_VMCTR1    0xC5  // VCOM Control 1

// Gamma
#define ST7735_GMCTRP1   0xE0  // Gamma '+' Polarity Correction
#define ST7735_GMCTRN1   0xE1  // Gamma '-' Polarity Correction

// MADCTL bits
#define ST7735_MADCTL_MY  0x80  // Row Address Order
#define ST7735_MADCTL_MX  0x40  // Column Address Order
#define ST7735_MADCTL_MV  0x20  // Row/Column Exchange
#define ST7735_MADCTL_ML  0x10  // Vertical Refresh Order
#define ST7735_MADCTL_RGB 0x00  // RGB Order
#define ST7735_MADCTL_BGR 0x08  // BGR Order
#define ST7735_MADCTL_MH  0x04  // Horizontal Refresh Order
