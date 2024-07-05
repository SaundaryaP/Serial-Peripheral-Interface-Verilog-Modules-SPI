## SPI (Serial Peripheral Interface) Verilog Modules 

This project explores the design and implementation of SPI (Serial Peripheral Interface) Master Core in detail. The primary goal of this project was to develop practical skills in designing and implementing digital circuits through Verilog, while also enhancing comprehension of the SPI protocol and its practical applications.

 ## Features of SPI

1. **Synchronous Communication:** Data is transmitted and received simultaneously using a shared clock signal.
   
2. **Master-Slave Configuration:** Typically involves one master device that initiates communication and one or more slave devices that respond to commands from the master.
   
3. **Communication Lines:**
   - **MOSI (Master Out Slave In):** Master transmits data to the slave(s).
   - **MISO (Master In Slave Out):** Slave(s) transmit data to the master.
   - **SCLK (Serial Clock):** Synchronizes data transfer between master and slave(s).
   - **SS (Slave Select):** Master selects which slave device to communicate with.
   
4. **Full-Duplex Communication:** Allows simultaneous transmission and reception of data.

## Architecture

#### Top Module

The top module integrates:
- **Wishbone Master Interface:** Facilitates communication across different components within the system.
- **SPI Master Core:** Implements SPI protocol as a master, managing SCLK, MOSI, MISO, SS lines, and configurations.
- **SPI Serial Slave:** Emulates a slave device, responding to commands and data from the SPI master.

  ![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/3ea9bd31-2fd5-43ed-913d-a9f52b1b2e9e)


### Sub-Blocks (SPI Master Core)

#### Clock Generator

Responsible for generating the SCLK:
- **Clock Divider:** Divides the system clock to generate desired SCLK frequency.
- **Clock Polarity (CPOL):** Determines idle state of the clock (high or low).
- **Clock Signal Output:** Provides the generated SCLK signal for synchronization.

#### Shift Register

Manages data transmission and reception:
- **Transmit Data Buffer:** Holds data to be sent from master to slave (MOSI).
- **Receive Data Buffer:** Stores received data from slave to master (MISO).
  
  ![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/80ae67b3-b09a-4c88-a48e-7efdd9edb767)


## Usage

The SPI system architecture facilitates seamless communication between the digital system and SPI peripherals. Configuration and data exchange are managed through the Wishbone master interface, which interacts with the SPI master core and SPI serial slave.

## Implementation Details

This project utilizes a standardized Wishbone bus architecture to coordinate communication between components. The SPI master core handles protocol-specific tasks, ensuring accurate and synchronized data transfer between the master and connected slave devices.

### Clock Generator Waveform 
![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/cf6d601c-e5d3-4ffd-9df6-c55cc9b3ba01)

### Shift Register Waveform 
![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/39b53f34-1d23-4769-af27-1e5b0d368085)

### Top Module Output 
1. tx_neg=1, rx_neg=0, lsb=1, char_len=4
   ![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/5c21aa5c-89d4-499b-b149-813858361811)

2. tx_neg=1, rx_neg=0, lsb=0, char_len=4
   ![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/c8883423-1d9c-4171-a374-ff5eb7b0160f)

3. tx_neg=0, rx_neg=1, lsb=1, char_len=4
   ![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/fb644697-eb0c-40a7-be98-d3f16f045d00)

4. tx_neg=0, rx_neg=1, lsb=0, char_len=4
   ![image](https://github.com/SaundaryaP/Serial-Peripheral-Interface-Verilog-Modules-SPI/assets/159157514/8baece88-afab-4309-8d9e-da6ee2d16c03)

For detailed implementation instructions, refer to the project documentation and source code.
