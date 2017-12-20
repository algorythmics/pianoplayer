#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../libs/escher/main.c ../libs/escher/escherRTC.c ../libs/escher/escherBoard.c ../libs/escher/DCI_tdm8channel.c ../libs/escher/escherUART.c ../libs/escher/escherBoardPlugins.c ../libs/escher/cs4385_i2c.c ../libs/tcpip/WiFi/WFParamMsg_24G.c ../libs/tcpip/WiFi/WFMgmtMsg_24G.c ../libs/tcpip/WiFi/WF_Spi.c ../libs/tcpip/WiFi/WFDebugStrings.c ../libs/tcpip/WiFi/WFDriverRaw_24G.c ../libs/tcpip/WiFi/WFTxPower.c ../libs/tcpip/WiFi/WFEasyConfig.c ../libs/tcpip/WiFi/WFDriverCom.c ../libs/tcpip/WiFi/WFMgmtMsg.c ../libs/tcpip/WiFi/WFMac.c ../libs/tcpip/WiFi/WF_pbkdf2.c ../libs/tcpip/WiFi/WFConsoleIwconfig.c ../libs/tcpip/WiFi/WFConsoleIwpriv.c ../libs/tcpip/WiFi/WFConsoleMsgHandler.c ../libs/tcpip/WiFi/WFParamMsg.c ../libs/tcpip/WiFi/WFConsoleMsgs.c ../libs/tcpip/WiFi/WF_Eint.c ../libs/tcpip/WiFi/WFDriverRaw.c ../libs/tcpip/WiFi/WFConsole.c ../libs/tcpip/WiFi/WFDataTxRx.c ../libs/tcpip/WiFi/WFMac_24G.c ../libs/tcpip/WiFi/WFConnectionAlgorithm.c ../libs/tcpip/WiFi/WFEventHandler.c ../libs/tcpip/WiFi/WFConnectionManager.c ../libs/tcpip/WiFi/WFInit.c ../libs/tcpip/WiFi/WFScan.c ../libs/tcpip/WiFi/WFConnectionProfile.c ../libs/tcpip/WiFi/WFConsoleIfconfig.c ../libs/tcpip/WiFi/WFPowerSave.c ../libs/tcpip/WiFi/WFDriverCom_24G.c ../libs/tcpip/ETHPIC32ExtPhyDP83640.c ../libs/tcpip/Hashes.c ../libs/tcpip/Telnet.c ../libs/tcpip/DNSs.c ../libs/tcpip/Announce.c ../libs/tcpip/UDP.c ../libs/tcpip/Reboot.c ../libs/tcpip/ENC28J60.c ../libs/tcpip/SNMP.c ../libs/tcpip/StackTsk.c ../libs/tcpip/BerkeleyAPI.c ../libs/tcpip/IP.c ../libs/tcpip/ETHPIC32ExtPhyDP83848.c ../libs/tcpip/FileSystem.c ../libs/tcpip/TCP.c ../libs/tcpip/SPIFlash.c ../libs/tcpip/Helpers.c ../libs/tcpip/SNMPv3USM.c ../libs/tcpip/ARCFOUR.c ../libs/tcpip/Random.c ../libs/tcpip/DHCP.c ../libs/tcpip/BigInt.c ../libs/tcpip/LCDBlocking.c ../libs/tcpip/SSL.c ../libs/tcpip/ETHPIC32IntMac.c ../libs/tcpip/ICMP.c ../libs/tcpip/eth_pic32_ext_phy_rtl8201FL.c ../libs/tcpip/SPIEEPROM.c ../libs/tcpip/DHCPs.c ../libs/tcpip/TCPPerformanceTest.c ../libs/tcpip/ETH97J60.c ../libs/tcpip/DNS.c ../libs/tcpip/SPIRAM.c ../libs/tcpip/Tick.c ../libs/tcpip/TFTPc.c ../libs/tcpip/RSA.c ../libs/tcpip/SNTP.c ../libs/tcpip/NBNS.c ../libs/tcpip/SMTP.c ../libs/tcpip/ENCX24J600.c ../libs/tcpip/ARP.c ../libs/tcpip/UART.c ../libs/tcpip/SNMPv3.c ../libs/tcpip/FTP.c ../libs/tcpip/ETHPIC32ExtPhy.c ../libs/tcpip/AutoIP.c ../libs/tcpip/UDPPerformanceTest.c ../libs/tcpip/ZeroconfHelper.c ../libs/tcpip/UART2TCPBridge.c ../libs/tcpip/MPFS2.c ../libs/tcpip/ETHPIC32ExtPhySMSC8700.c ../libs/tcpip/HTTP2.c ../libs/tcpip/ETHPIC32ExtPhySMSC8720.c ../libs/tcpip/DynDNS.c ../libs/tcpip/ZeroconfMulticastDNS.c ../libs/tcpip/Delay.c ../libs/tcpip/ZeroconfLinkLocal.c src/enSecOsc.s src/escherPWM.c src/escherSerial.c src/escherUDP.c src/play_pulses.c src/rhea.c src/rhea_timer4.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1290227118/main.o ${OBJECTDIR}/_ext/1290227118/escherRTC.o ${OBJECTDIR}/_ext/1290227118/escherBoard.o ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o ${OBJECTDIR}/_ext/1290227118/escherUART.o ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o ${OBJECTDIR}/_ext/829574130/WF_Spi.o ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o ${OBJECTDIR}/_ext/829574130/WFTxPower.o ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o ${OBJECTDIR}/_ext/829574130/WFDriverCom.o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o ${OBJECTDIR}/_ext/829574130/WFMac.o ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o ${OBJECTDIR}/_ext/829574130/WFParamMsg.o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o ${OBJECTDIR}/_ext/829574130/WF_Eint.o ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o ${OBJECTDIR}/_ext/829574130/WFConsole.o ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o ${OBJECTDIR}/_ext/829574130/WFMac_24G.o ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o ${OBJECTDIR}/_ext/829574130/WFEventHandler.o ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o ${OBJECTDIR}/_ext/829574130/WFInit.o ${OBJECTDIR}/_ext/829574130/WFScan.o ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o ${OBJECTDIR}/_ext/829574130/WFPowerSave.o ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o ${OBJECTDIR}/_ext/1357241782/Hashes.o ${OBJECTDIR}/_ext/1357241782/Telnet.o ${OBJECTDIR}/_ext/1357241782/DNSs.o ${OBJECTDIR}/_ext/1357241782/Announce.o ${OBJECTDIR}/_ext/1357241782/UDP.o ${OBJECTDIR}/_ext/1357241782/Reboot.o ${OBJECTDIR}/_ext/1357241782/ENC28J60.o ${OBJECTDIR}/_ext/1357241782/SNMP.o ${OBJECTDIR}/_ext/1357241782/StackTsk.o ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o ${OBJECTDIR}/_ext/1357241782/IP.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/_ext/1357241782/FileSystem.o ${OBJECTDIR}/_ext/1357241782/TCP.o ${OBJECTDIR}/_ext/1357241782/SPIFlash.o ${OBJECTDIR}/_ext/1357241782/Helpers.o ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o ${OBJECTDIR}/_ext/1357241782/Random.o ${OBJECTDIR}/_ext/1357241782/DHCP.o ${OBJECTDIR}/_ext/1357241782/BigInt.o ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o ${OBJECTDIR}/_ext/1357241782/SSL.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1357241782/ICMP.o ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o ${OBJECTDIR}/_ext/1357241782/DHCPs.o ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1357241782/ETH97J60.o ${OBJECTDIR}/_ext/1357241782/DNS.o ${OBJECTDIR}/_ext/1357241782/SPIRAM.o ${OBJECTDIR}/_ext/1357241782/Tick.o ${OBJECTDIR}/_ext/1357241782/TFTPc.o ${OBJECTDIR}/_ext/1357241782/RSA.o ${OBJECTDIR}/_ext/1357241782/SNTP.o ${OBJECTDIR}/_ext/1357241782/NBNS.o ${OBJECTDIR}/_ext/1357241782/SMTP.o ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o ${OBJECTDIR}/_ext/1357241782/ARP.o ${OBJECTDIR}/_ext/1357241782/UART.o ${OBJECTDIR}/_ext/1357241782/SNMPv3.o ${OBJECTDIR}/_ext/1357241782/FTP.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o ${OBJECTDIR}/_ext/1357241782/AutoIP.o ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o ${OBJECTDIR}/_ext/1357241782/MPFS2.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o ${OBJECTDIR}/_ext/1357241782/HTTP2.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o ${OBJECTDIR}/_ext/1357241782/DynDNS.o ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o ${OBJECTDIR}/_ext/1357241782/Delay.o ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o ${OBJECTDIR}/src/enSecOsc.o ${OBJECTDIR}/src/escherPWM.o ${OBJECTDIR}/src/escherSerial.o ${OBJECTDIR}/src/escherUDP.o ${OBJECTDIR}/src/play_pulses.o ${OBJECTDIR}/src/rhea.o ${OBJECTDIR}/src/rhea_timer4.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1290227118/main.o.d ${OBJECTDIR}/_ext/1290227118/escherRTC.o.d ${OBJECTDIR}/_ext/1290227118/escherBoard.o.d ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o.d ${OBJECTDIR}/_ext/1290227118/escherUART.o.d ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o.d ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o.d ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o.d ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o.d ${OBJECTDIR}/_ext/829574130/WF_Spi.o.d ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o.d ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o.d ${OBJECTDIR}/_ext/829574130/WFTxPower.o.d ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o.d ${OBJECTDIR}/_ext/829574130/WFDriverCom.o.d ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o.d ${OBJECTDIR}/_ext/829574130/WFMac.o.d ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o.d ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o.d ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o.d ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o.d ${OBJECTDIR}/_ext/829574130/WFParamMsg.o.d ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o.d ${OBJECTDIR}/_ext/829574130/WF_Eint.o.d ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o.d ${OBJECTDIR}/_ext/829574130/WFConsole.o.d ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o.d ${OBJECTDIR}/_ext/829574130/WFMac_24G.o.d ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o.d ${OBJECTDIR}/_ext/829574130/WFEventHandler.o.d ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o.d ${OBJECTDIR}/_ext/829574130/WFInit.o.d ${OBJECTDIR}/_ext/829574130/WFScan.o.d ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o.d ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o.d ${OBJECTDIR}/_ext/829574130/WFPowerSave.o.d ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o.d ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o.d ${OBJECTDIR}/_ext/1357241782/Hashes.o.d ${OBJECTDIR}/_ext/1357241782/Telnet.o.d ${OBJECTDIR}/_ext/1357241782/DNSs.o.d ${OBJECTDIR}/_ext/1357241782/Announce.o.d ${OBJECTDIR}/_ext/1357241782/UDP.o.d ${OBJECTDIR}/_ext/1357241782/Reboot.o.d ${OBJECTDIR}/_ext/1357241782/ENC28J60.o.d ${OBJECTDIR}/_ext/1357241782/SNMP.o.d ${OBJECTDIR}/_ext/1357241782/StackTsk.o.d ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o.d ${OBJECTDIR}/_ext/1357241782/IP.o.d ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o.d ${OBJECTDIR}/_ext/1357241782/FileSystem.o.d ${OBJECTDIR}/_ext/1357241782/TCP.o.d ${OBJECTDIR}/_ext/1357241782/SPIFlash.o.d ${OBJECTDIR}/_ext/1357241782/Helpers.o.d ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o.d ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o.d ${OBJECTDIR}/_ext/1357241782/Random.o.d ${OBJECTDIR}/_ext/1357241782/DHCP.o.d ${OBJECTDIR}/_ext/1357241782/BigInt.o.d ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o.d ${OBJECTDIR}/_ext/1357241782/SSL.o.d ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o.d ${OBJECTDIR}/_ext/1357241782/ICMP.o.d ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o.d ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o.d ${OBJECTDIR}/_ext/1357241782/DHCPs.o.d ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o.d ${OBJECTDIR}/_ext/1357241782/ETH97J60.o.d ${OBJECTDIR}/_ext/1357241782/DNS.o.d ${OBJECTDIR}/_ext/1357241782/SPIRAM.o.d ${OBJECTDIR}/_ext/1357241782/Tick.o.d ${OBJECTDIR}/_ext/1357241782/TFTPc.o.d ${OBJECTDIR}/_ext/1357241782/RSA.o.d ${OBJECTDIR}/_ext/1357241782/SNTP.o.d ${OBJECTDIR}/_ext/1357241782/NBNS.o.d ${OBJECTDIR}/_ext/1357241782/SMTP.o.d ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o.d ${OBJECTDIR}/_ext/1357241782/ARP.o.d ${OBJECTDIR}/_ext/1357241782/UART.o.d ${OBJECTDIR}/_ext/1357241782/SNMPv3.o.d ${OBJECTDIR}/_ext/1357241782/FTP.o.d ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o.d ${OBJECTDIR}/_ext/1357241782/AutoIP.o.d ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o.d ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o.d ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o.d ${OBJECTDIR}/_ext/1357241782/MPFS2.o.d ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o.d ${OBJECTDIR}/_ext/1357241782/HTTP2.o.d ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o.d ${OBJECTDIR}/_ext/1357241782/DynDNS.o.d ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o.d ${OBJECTDIR}/_ext/1357241782/Delay.o.d ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o.d ${OBJECTDIR}/src/enSecOsc.o.d ${OBJECTDIR}/src/escherPWM.o.d ${OBJECTDIR}/src/escherSerial.o.d ${OBJECTDIR}/src/escherUDP.o.d ${OBJECTDIR}/src/play_pulses.o.d ${OBJECTDIR}/src/rhea.o.d ${OBJECTDIR}/src/rhea_timer4.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1290227118/main.o ${OBJECTDIR}/_ext/1290227118/escherRTC.o ${OBJECTDIR}/_ext/1290227118/escherBoard.o ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o ${OBJECTDIR}/_ext/1290227118/escherUART.o ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o ${OBJECTDIR}/_ext/829574130/WF_Spi.o ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o ${OBJECTDIR}/_ext/829574130/WFTxPower.o ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o ${OBJECTDIR}/_ext/829574130/WFDriverCom.o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o ${OBJECTDIR}/_ext/829574130/WFMac.o ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o ${OBJECTDIR}/_ext/829574130/WFParamMsg.o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o ${OBJECTDIR}/_ext/829574130/WF_Eint.o ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o ${OBJECTDIR}/_ext/829574130/WFConsole.o ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o ${OBJECTDIR}/_ext/829574130/WFMac_24G.o ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o ${OBJECTDIR}/_ext/829574130/WFEventHandler.o ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o ${OBJECTDIR}/_ext/829574130/WFInit.o ${OBJECTDIR}/_ext/829574130/WFScan.o ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o ${OBJECTDIR}/_ext/829574130/WFPowerSave.o ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o ${OBJECTDIR}/_ext/1357241782/Hashes.o ${OBJECTDIR}/_ext/1357241782/Telnet.o ${OBJECTDIR}/_ext/1357241782/DNSs.o ${OBJECTDIR}/_ext/1357241782/Announce.o ${OBJECTDIR}/_ext/1357241782/UDP.o ${OBJECTDIR}/_ext/1357241782/Reboot.o ${OBJECTDIR}/_ext/1357241782/ENC28J60.o ${OBJECTDIR}/_ext/1357241782/SNMP.o ${OBJECTDIR}/_ext/1357241782/StackTsk.o ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o ${OBJECTDIR}/_ext/1357241782/IP.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/_ext/1357241782/FileSystem.o ${OBJECTDIR}/_ext/1357241782/TCP.o ${OBJECTDIR}/_ext/1357241782/SPIFlash.o ${OBJECTDIR}/_ext/1357241782/Helpers.o ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o ${OBJECTDIR}/_ext/1357241782/Random.o ${OBJECTDIR}/_ext/1357241782/DHCP.o ${OBJECTDIR}/_ext/1357241782/BigInt.o ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o ${OBJECTDIR}/_ext/1357241782/SSL.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1357241782/ICMP.o ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o ${OBJECTDIR}/_ext/1357241782/DHCPs.o ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1357241782/ETH97J60.o ${OBJECTDIR}/_ext/1357241782/DNS.o ${OBJECTDIR}/_ext/1357241782/SPIRAM.o ${OBJECTDIR}/_ext/1357241782/Tick.o ${OBJECTDIR}/_ext/1357241782/TFTPc.o ${OBJECTDIR}/_ext/1357241782/RSA.o ${OBJECTDIR}/_ext/1357241782/SNTP.o ${OBJECTDIR}/_ext/1357241782/NBNS.o ${OBJECTDIR}/_ext/1357241782/SMTP.o ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o ${OBJECTDIR}/_ext/1357241782/ARP.o ${OBJECTDIR}/_ext/1357241782/UART.o ${OBJECTDIR}/_ext/1357241782/SNMPv3.o ${OBJECTDIR}/_ext/1357241782/FTP.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o ${OBJECTDIR}/_ext/1357241782/AutoIP.o ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o ${OBJECTDIR}/_ext/1357241782/MPFS2.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o ${OBJECTDIR}/_ext/1357241782/HTTP2.o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o ${OBJECTDIR}/_ext/1357241782/DynDNS.o ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o ${OBJECTDIR}/_ext/1357241782/Delay.o ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o ${OBJECTDIR}/src/enSecOsc.o ${OBJECTDIR}/src/escherPWM.o ${OBJECTDIR}/src/escherSerial.o ${OBJECTDIR}/src/escherUDP.o ${OBJECTDIR}/src/play_pulses.o ${OBJECTDIR}/src/rhea.o ${OBJECTDIR}/src/rhea_timer4.o

# Source Files
SOURCEFILES=../libs/escher/main.c ../libs/escher/escherRTC.c ../libs/escher/escherBoard.c ../libs/escher/DCI_tdm8channel.c ../libs/escher/escherUART.c ../libs/escher/escherBoardPlugins.c ../libs/escher/cs4385_i2c.c ../libs/tcpip/WiFi/WFParamMsg_24G.c ../libs/tcpip/WiFi/WFMgmtMsg_24G.c ../libs/tcpip/WiFi/WF_Spi.c ../libs/tcpip/WiFi/WFDebugStrings.c ../libs/tcpip/WiFi/WFDriverRaw_24G.c ../libs/tcpip/WiFi/WFTxPower.c ../libs/tcpip/WiFi/WFEasyConfig.c ../libs/tcpip/WiFi/WFDriverCom.c ../libs/tcpip/WiFi/WFMgmtMsg.c ../libs/tcpip/WiFi/WFMac.c ../libs/tcpip/WiFi/WF_pbkdf2.c ../libs/tcpip/WiFi/WFConsoleIwconfig.c ../libs/tcpip/WiFi/WFConsoleIwpriv.c ../libs/tcpip/WiFi/WFConsoleMsgHandler.c ../libs/tcpip/WiFi/WFParamMsg.c ../libs/tcpip/WiFi/WFConsoleMsgs.c ../libs/tcpip/WiFi/WF_Eint.c ../libs/tcpip/WiFi/WFDriverRaw.c ../libs/tcpip/WiFi/WFConsole.c ../libs/tcpip/WiFi/WFDataTxRx.c ../libs/tcpip/WiFi/WFMac_24G.c ../libs/tcpip/WiFi/WFConnectionAlgorithm.c ../libs/tcpip/WiFi/WFEventHandler.c ../libs/tcpip/WiFi/WFConnectionManager.c ../libs/tcpip/WiFi/WFInit.c ../libs/tcpip/WiFi/WFScan.c ../libs/tcpip/WiFi/WFConnectionProfile.c ../libs/tcpip/WiFi/WFConsoleIfconfig.c ../libs/tcpip/WiFi/WFPowerSave.c ../libs/tcpip/WiFi/WFDriverCom_24G.c ../libs/tcpip/ETHPIC32ExtPhyDP83640.c ../libs/tcpip/Hashes.c ../libs/tcpip/Telnet.c ../libs/tcpip/DNSs.c ../libs/tcpip/Announce.c ../libs/tcpip/UDP.c ../libs/tcpip/Reboot.c ../libs/tcpip/ENC28J60.c ../libs/tcpip/SNMP.c ../libs/tcpip/StackTsk.c ../libs/tcpip/BerkeleyAPI.c ../libs/tcpip/IP.c ../libs/tcpip/ETHPIC32ExtPhyDP83848.c ../libs/tcpip/FileSystem.c ../libs/tcpip/TCP.c ../libs/tcpip/SPIFlash.c ../libs/tcpip/Helpers.c ../libs/tcpip/SNMPv3USM.c ../libs/tcpip/ARCFOUR.c ../libs/tcpip/Random.c ../libs/tcpip/DHCP.c ../libs/tcpip/BigInt.c ../libs/tcpip/LCDBlocking.c ../libs/tcpip/SSL.c ../libs/tcpip/ETHPIC32IntMac.c ../libs/tcpip/ICMP.c ../libs/tcpip/eth_pic32_ext_phy_rtl8201FL.c ../libs/tcpip/SPIEEPROM.c ../libs/tcpip/DHCPs.c ../libs/tcpip/TCPPerformanceTest.c ../libs/tcpip/ETH97J60.c ../libs/tcpip/DNS.c ../libs/tcpip/SPIRAM.c ../libs/tcpip/Tick.c ../libs/tcpip/TFTPc.c ../libs/tcpip/RSA.c ../libs/tcpip/SNTP.c ../libs/tcpip/NBNS.c ../libs/tcpip/SMTP.c ../libs/tcpip/ENCX24J600.c ../libs/tcpip/ARP.c ../libs/tcpip/UART.c ../libs/tcpip/SNMPv3.c ../libs/tcpip/FTP.c ../libs/tcpip/ETHPIC32ExtPhy.c ../libs/tcpip/AutoIP.c ../libs/tcpip/UDPPerformanceTest.c ../libs/tcpip/ZeroconfHelper.c ../libs/tcpip/UART2TCPBridge.c ../libs/tcpip/MPFS2.c ../libs/tcpip/ETHPIC32ExtPhySMSC8700.c ../libs/tcpip/HTTP2.c ../libs/tcpip/ETHPIC32ExtPhySMSC8720.c ../libs/tcpip/DynDNS.c ../libs/tcpip/ZeroconfMulticastDNS.c ../libs/tcpip/Delay.c ../libs/tcpip/ZeroconfLinkLocal.c src/enSecOsc.s src/escherPWM.c src/escherSerial.c src/escherUDP.c src/play_pulses.c src/rhea.c src/rhea_timer4.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC708A
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC708A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1290227118/main.o: ../libs/escher/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/main.c  -o ${OBJECTDIR}/_ext/1290227118/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherRTC.o: ../libs/escher/escherRTC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherRTC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherRTC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherRTC.c  -o ${OBJECTDIR}/_ext/1290227118/escherRTC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherRTC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherRTC.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherBoard.o: ../libs/escher/escherBoard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherBoard.c  -o ${OBJECTDIR}/_ext/1290227118/escherBoard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherBoard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherBoard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o: ../libs/escher/DCI_tdm8channel.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/DCI_tdm8channel.c  -o ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherUART.o: ../libs/escher/escherUART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherUART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherUART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherUART.c  -o ${OBJECTDIR}/_ext/1290227118/escherUART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherUART.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherUART.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o: ../libs/escher/escherBoardPlugins.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherBoardPlugins.c  -o ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o: ../libs/escher/cs4385_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/cs4385_i2c.c  -o ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o: ../libs/tcpip/WiFi/WFParamMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFParamMsg_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o: ../libs/tcpip/WiFi/WFMgmtMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMgmtMsg_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WF_Spi.o: ../libs/tcpip/WiFi/WF_Spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WF_Spi.c  -o ${OBJECTDIR}/_ext/829574130/WF_Spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WF_Spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WF_Spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDebugStrings.o: ../libs/tcpip/WiFi/WFDebugStrings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDebugStrings.c  -o ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDebugStrings.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDebugStrings.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o: ../libs/tcpip/WiFi/WFDriverRaw_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverRaw_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFTxPower.o: ../libs/tcpip/WiFi/WFTxPower.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFTxPower.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFTxPower.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFTxPower.c  -o ${OBJECTDIR}/_ext/829574130/WFTxPower.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFTxPower.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFTxPower.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFEasyConfig.o: ../libs/tcpip/WiFi/WFEasyConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFEasyConfig.c  -o ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFEasyConfig.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFEasyConfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverCom.o: ../libs/tcpip/WiFi/WFDriverCom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverCom.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverCom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverCom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverCom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o: ../libs/tcpip/WiFi/WFMgmtMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMgmtMsg.c  -o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMac.o: ../libs/tcpip/WiFi/WFMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMac.c  -o ${OBJECTDIR}/_ext/829574130/WFMac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMac.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o: ../libs/tcpip/WiFi/WF_pbkdf2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WF_pbkdf2.c  -o ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o: ../libs/tcpip/WiFi/WFConsoleIwconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleIwconfig.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o: ../libs/tcpip/WiFi/WFConsoleIwpriv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleIwpriv.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o: ../libs/tcpip/WiFi/WFConsoleMsgHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleMsgHandler.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFParamMsg.o: ../libs/tcpip/WiFi/WFParamMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFParamMsg.c  -o ${OBJECTDIR}/_ext/829574130/WFParamMsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFParamMsg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFParamMsg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o: ../libs/tcpip/WiFi/WFConsoleMsgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleMsgs.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WF_Eint.o: ../libs/tcpip/WiFi/WF_Eint.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Eint.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Eint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WF_Eint.c  -o ${OBJECTDIR}/_ext/829574130/WF_Eint.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WF_Eint.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WF_Eint.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverRaw.o: ../libs/tcpip/WiFi/WFDriverRaw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverRaw.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverRaw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverRaw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsole.o: ../libs/tcpip/WiFi/WFConsole.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsole.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsole.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsole.c  -o ${OBJECTDIR}/_ext/829574130/WFConsole.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsole.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsole.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDataTxRx.o: ../libs/tcpip/WiFi/WFDataTxRx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDataTxRx.c  -o ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDataTxRx.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDataTxRx.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMac_24G.o: ../libs/tcpip/WiFi/WFMac_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMac_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFMac_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMac_24G.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMac_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o: ../libs/tcpip/WiFi/WFConnectionAlgorithm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConnectionAlgorithm.c  -o ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFEventHandler.o: ../libs/tcpip/WiFi/WFEventHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEventHandler.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEventHandler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFEventHandler.c  -o ${OBJECTDIR}/_ext/829574130/WFEventHandler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFEventHandler.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFEventHandler.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConnectionManager.o: ../libs/tcpip/WiFi/WFConnectionManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConnectionManager.c  -o ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConnectionManager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConnectionManager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFInit.o: ../libs/tcpip/WiFi/WFInit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFInit.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFInit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFInit.c  -o ${OBJECTDIR}/_ext/829574130/WFInit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFInit.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFInit.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFScan.o: ../libs/tcpip/WiFi/WFScan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFScan.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFScan.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFScan.c  -o ${OBJECTDIR}/_ext/829574130/WFScan.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFScan.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFScan.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o: ../libs/tcpip/WiFi/WFConnectionProfile.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConnectionProfile.c  -o ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o: ../libs/tcpip/WiFi/WFConsoleIfconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleIfconfig.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFPowerSave.o: ../libs/tcpip/WiFi/WFPowerSave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFPowerSave.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFPowerSave.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFPowerSave.c  -o ${OBJECTDIR}/_ext/829574130/WFPowerSave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFPowerSave.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFPowerSave.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o: ../libs/tcpip/WiFi/WFDriverCom_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverCom_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o: ../libs/tcpip/ETHPIC32ExtPhyDP83640.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhyDP83640.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Hashes.o: ../libs/tcpip/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Hashes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Hashes.c  -o ${OBJECTDIR}/_ext/1357241782/Hashes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Hashes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Hashes.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Telnet.o: ../libs/tcpip/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Telnet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Telnet.c  -o ${OBJECTDIR}/_ext/1357241782/Telnet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Telnet.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Telnet.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DNSs.o: ../libs/tcpip/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNSs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNSs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DNSs.c  -o ${OBJECTDIR}/_ext/1357241782/DNSs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DNSs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DNSs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Announce.o: ../libs/tcpip/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Announce.c  -o ${OBJECTDIR}/_ext/1357241782/Announce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Announce.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Announce.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UDP.o: ../libs/tcpip/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UDP.c  -o ${OBJECTDIR}/_ext/1357241782/UDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UDP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UDP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Reboot.o: ../libs/tcpip/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Reboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Reboot.c  -o ${OBJECTDIR}/_ext/1357241782/Reboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Reboot.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Reboot.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ENC28J60.o: ../libs/tcpip/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ENC28J60.c  -o ${OBJECTDIR}/_ext/1357241782/ENC28J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ENC28J60.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ENC28J60.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNMP.o: ../libs/tcpip/SNMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNMP.c  -o ${OBJECTDIR}/_ext/1357241782/SNMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNMP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNMP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/StackTsk.o: ../libs/tcpip/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/StackTsk.c  -o ${OBJECTDIR}/_ext/1357241782/StackTsk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/StackTsk.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/StackTsk.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o: ../libs/tcpip/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/BerkeleyAPI.c  -o ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/IP.o: ../libs/tcpip/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/IP.c  -o ${OBJECTDIR}/_ext/1357241782/IP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/IP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/IP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o: ../libs/tcpip/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhyDP83848.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/FileSystem.o: ../libs/tcpip/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FileSystem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FileSystem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/FileSystem.c  -o ${OBJECTDIR}/_ext/1357241782/FileSystem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/FileSystem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/FileSystem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/TCP.o: ../libs/tcpip/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/TCP.c  -o ${OBJECTDIR}/_ext/1357241782/TCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/TCP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/TCP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SPIFlash.o: ../libs/tcpip/SPIFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIFlash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SPIFlash.c  -o ${OBJECTDIR}/_ext/1357241782/SPIFlash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SPIFlash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SPIFlash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Helpers.o: ../libs/tcpip/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Helpers.c  -o ${OBJECTDIR}/_ext/1357241782/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Helpers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Helpers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o: ../libs/tcpip/SNMPv3USM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNMPv3USM.c  -o ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ARCFOUR.o: ../libs/tcpip/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ARCFOUR.c  -o ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ARCFOUR.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ARCFOUR.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Random.o: ../libs/tcpip/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Random.c  -o ${OBJECTDIR}/_ext/1357241782/Random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Random.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Random.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DHCP.o: ../libs/tcpip/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DHCP.c  -o ${OBJECTDIR}/_ext/1357241782/DHCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DHCP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DHCP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/BigInt.o: ../libs/tcpip/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BigInt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BigInt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/BigInt.c  -o ${OBJECTDIR}/_ext/1357241782/BigInt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/BigInt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/BigInt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/LCDBlocking.o: ../libs/tcpip/LCDBlocking.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/LCDBlocking.c  -o ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/LCDBlocking.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/LCDBlocking.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SSL.o: ../libs/tcpip/SSL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SSL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SSL.c  -o ${OBJECTDIR}/_ext/1357241782/SSL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SSL.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SSL.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o: ../libs/tcpip/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32IntMac.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ICMP.o: ../libs/tcpip/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ICMP.c  -o ${OBJECTDIR}/_ext/1357241782/ICMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ICMP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ICMP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o: ../libs/tcpip/eth_pic32_ext_phy_rtl8201FL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/eth_pic32_ext_phy_rtl8201FL.c  -o ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o: ../libs/tcpip/SPIEEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SPIEEPROM.c  -o ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DHCPs.o: ../libs/tcpip/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCPs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DHCPs.c  -o ${OBJECTDIR}/_ext/1357241782/DHCPs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DHCPs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DHCPs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o: ../libs/tcpip/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/TCPPerformanceTest.c  -o ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETH97J60.o: ../libs/tcpip/ETH97J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETH97J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETH97J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETH97J60.c  -o ${OBJECTDIR}/_ext/1357241782/ETH97J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETH97J60.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETH97J60.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DNS.o: ../libs/tcpip/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DNS.c  -o ${OBJECTDIR}/_ext/1357241782/DNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SPIRAM.o: ../libs/tcpip/SPIRAM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIRAM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SPIRAM.c  -o ${OBJECTDIR}/_ext/1357241782/SPIRAM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SPIRAM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SPIRAM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Tick.o: ../libs/tcpip/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Tick.c  -o ${OBJECTDIR}/_ext/1357241782/Tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Tick.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/TFTPc.o: ../libs/tcpip/TFTPc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TFTPc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/TFTPc.c  -o ${OBJECTDIR}/_ext/1357241782/TFTPc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/TFTPc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/TFTPc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/RSA.o: ../libs/tcpip/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/RSA.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/RSA.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/RSA.c  -o ${OBJECTDIR}/_ext/1357241782/RSA.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/RSA.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/RSA.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNTP.o: ../libs/tcpip/SNTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNTP.c  -o ${OBJECTDIR}/_ext/1357241782/SNTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNTP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/NBNS.o: ../libs/tcpip/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/NBNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/NBNS.c  -o ${OBJECTDIR}/_ext/1357241782/NBNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/NBNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/NBNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SMTP.o: ../libs/tcpip/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SMTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SMTP.c  -o ${OBJECTDIR}/_ext/1357241782/SMTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SMTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SMTP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ENCX24J600.o: ../libs/tcpip/ENCX24J600.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ENCX24J600.c  -o ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ENCX24J600.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ENCX24J600.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ARP.o: ../libs/tcpip/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ARP.c  -o ${OBJECTDIR}/_ext/1357241782/ARP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ARP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ARP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UART.o: ../libs/tcpip/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UART.c  -o ${OBJECTDIR}/_ext/1357241782/UART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UART.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UART.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNMPv3.o: ../libs/tcpip/SNMPv3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNMPv3.c  -o ${OBJECTDIR}/_ext/1357241782/SNMPv3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNMPv3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNMPv3.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/FTP.o: ../libs/tcpip/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/FTP.c  -o ${OBJECTDIR}/_ext/1357241782/FTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/FTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/FTP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o: ../libs/tcpip/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhy.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/AutoIP.o: ../libs/tcpip/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/AutoIP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/AutoIP.c  -o ${OBJECTDIR}/_ext/1357241782/AutoIP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/AutoIP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/AutoIP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o: ../libs/tcpip/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UDPPerformanceTest.c  -o ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o: ../libs/tcpip/ZeroconfHelper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ZeroconfHelper.c  -o ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o: ../libs/tcpip/UART2TCPBridge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UART2TCPBridge.c  -o ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/MPFS2.o: ../libs/tcpip/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/MPFS2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/MPFS2.c  -o ${OBJECTDIR}/_ext/1357241782/MPFS2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/MPFS2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/MPFS2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o: ../libs/tcpip/ETHPIC32ExtPhySMSC8700.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhySMSC8700.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/HTTP2.o: ../libs/tcpip/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/HTTP2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/HTTP2.c  -o ${OBJECTDIR}/_ext/1357241782/HTTP2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/HTTP2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/HTTP2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o: ../libs/tcpip/ETHPIC32ExtPhySMSC8720.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhySMSC8720.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DynDNS.o: ../libs/tcpip/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DynDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DynDNS.c  -o ${OBJECTDIR}/_ext/1357241782/DynDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DynDNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DynDNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o: ../libs/tcpip/ZeroconfMulticastDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ZeroconfMulticastDNS.c  -o ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Delay.o: ../libs/tcpip/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Delay.c  -o ${OBJECTDIR}/_ext/1357241782/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o: ../libs/tcpip/ZeroconfLinkLocal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ZeroconfLinkLocal.c  -o ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/escherPWM.o: src/escherPWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/escherPWM.o.d 
	@${RM} ${OBJECTDIR}/src/escherPWM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/escherPWM.c  -o ${OBJECTDIR}/src/escherPWM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/escherPWM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/escherPWM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/escherSerial.o: src/escherSerial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/escherSerial.o.d 
	@${RM} ${OBJECTDIR}/src/escherSerial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/escherSerial.c  -o ${OBJECTDIR}/src/escherSerial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/escherSerial.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/escherSerial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/escherUDP.o: src/escherUDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/escherUDP.o.d 
	@${RM} ${OBJECTDIR}/src/escherUDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/escherUDP.c  -o ${OBJECTDIR}/src/escherUDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/escherUDP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/escherUDP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/play_pulses.o: src/play_pulses.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/play_pulses.o.d 
	@${RM} ${OBJECTDIR}/src/play_pulses.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/play_pulses.c  -o ${OBJECTDIR}/src/play_pulses.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/play_pulses.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/play_pulses.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/rhea.o: src/rhea.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rhea.o.d 
	@${RM} ${OBJECTDIR}/src/rhea.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rhea.c  -o ${OBJECTDIR}/src/rhea.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/rhea.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/rhea.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/rhea_timer4.o: src/rhea_timer4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rhea_timer4.o.d 
	@${RM} ${OBJECTDIR}/src/rhea_timer4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rhea_timer4.c  -o ${OBJECTDIR}/src/rhea_timer4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/rhea_timer4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/rhea_timer4.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1290227118/main.o: ../libs/escher/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/main.c  -o ${OBJECTDIR}/_ext/1290227118/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/main.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherRTC.o: ../libs/escher/escherRTC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherRTC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherRTC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherRTC.c  -o ${OBJECTDIR}/_ext/1290227118/escherRTC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherRTC.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherRTC.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherBoard.o: ../libs/escher/escherBoard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherBoard.c  -o ${OBJECTDIR}/_ext/1290227118/escherBoard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherBoard.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherBoard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o: ../libs/escher/DCI_tdm8channel.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/DCI_tdm8channel.c  -o ${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/DCI_tdm8channel.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherUART.o: ../libs/escher/escherUART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherUART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherUART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherUART.c  -o ${OBJECTDIR}/_ext/1290227118/escherUART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherUART.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherUART.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o: ../libs/escher/escherBoardPlugins.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/escherBoardPlugins.c  -o ${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/escherBoardPlugins.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o: ../libs/escher/cs4385_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1290227118" 
	@${RM} ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/escher/cs4385_i2c.c  -o ${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290227118/cs4385_i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o: ../libs/tcpip/WiFi/WFParamMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFParamMsg_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFParamMsg_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o: ../libs/tcpip/WiFi/WFMgmtMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMgmtMsg_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMgmtMsg_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WF_Spi.o: ../libs/tcpip/WiFi/WF_Spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WF_Spi.c  -o ${OBJECTDIR}/_ext/829574130/WF_Spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WF_Spi.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WF_Spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDebugStrings.o: ../libs/tcpip/WiFi/WFDebugStrings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDebugStrings.c  -o ${OBJECTDIR}/_ext/829574130/WFDebugStrings.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDebugStrings.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDebugStrings.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o: ../libs/tcpip/WiFi/WFDriverRaw_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverRaw_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverRaw_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFTxPower.o: ../libs/tcpip/WiFi/WFTxPower.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFTxPower.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFTxPower.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFTxPower.c  -o ${OBJECTDIR}/_ext/829574130/WFTxPower.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFTxPower.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFTxPower.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFEasyConfig.o: ../libs/tcpip/WiFi/WFEasyConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFEasyConfig.c  -o ${OBJECTDIR}/_ext/829574130/WFEasyConfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFEasyConfig.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFEasyConfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverCom.o: ../libs/tcpip/WiFi/WFDriverCom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverCom.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverCom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverCom.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverCom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o: ../libs/tcpip/WiFi/WFMgmtMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMgmtMsg.c  -o ${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMgmtMsg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMac.o: ../libs/tcpip/WiFi/WFMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMac.c  -o ${OBJECTDIR}/_ext/829574130/WFMac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMac.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o: ../libs/tcpip/WiFi/WF_pbkdf2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WF_pbkdf2.c  -o ${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WF_pbkdf2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o: ../libs/tcpip/WiFi/WFConsoleIwconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleIwconfig.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleIwconfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o: ../libs/tcpip/WiFi/WFConsoleIwpriv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleIwpriv.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleIwpriv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o: ../libs/tcpip/WiFi/WFConsoleMsgHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleMsgHandler.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleMsgHandler.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFParamMsg.o: ../libs/tcpip/WiFi/WFParamMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFParamMsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFParamMsg.c  -o ${OBJECTDIR}/_ext/829574130/WFParamMsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFParamMsg.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFParamMsg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o: ../libs/tcpip/WiFi/WFConsoleMsgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleMsgs.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleMsgs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WF_Eint.o: ../libs/tcpip/WiFi/WF_Eint.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Eint.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WF_Eint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WF_Eint.c  -o ${OBJECTDIR}/_ext/829574130/WF_Eint.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WF_Eint.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WF_Eint.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverRaw.o: ../libs/tcpip/WiFi/WFDriverRaw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverRaw.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverRaw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverRaw.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverRaw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsole.o: ../libs/tcpip/WiFi/WFConsole.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsole.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsole.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsole.c  -o ${OBJECTDIR}/_ext/829574130/WFConsole.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsole.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsole.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDataTxRx.o: ../libs/tcpip/WiFi/WFDataTxRx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDataTxRx.c  -o ${OBJECTDIR}/_ext/829574130/WFDataTxRx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDataTxRx.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDataTxRx.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFMac_24G.o: ../libs/tcpip/WiFi/WFMac_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFMac_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFMac_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFMac_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFMac_24G.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFMac_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o: ../libs/tcpip/WiFi/WFConnectionAlgorithm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConnectionAlgorithm.c  -o ${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConnectionAlgorithm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFEventHandler.o: ../libs/tcpip/WiFi/WFEventHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEventHandler.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFEventHandler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFEventHandler.c  -o ${OBJECTDIR}/_ext/829574130/WFEventHandler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFEventHandler.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFEventHandler.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConnectionManager.o: ../libs/tcpip/WiFi/WFConnectionManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConnectionManager.c  -o ${OBJECTDIR}/_ext/829574130/WFConnectionManager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConnectionManager.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConnectionManager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFInit.o: ../libs/tcpip/WiFi/WFInit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFInit.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFInit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFInit.c  -o ${OBJECTDIR}/_ext/829574130/WFInit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFInit.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFInit.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFScan.o: ../libs/tcpip/WiFi/WFScan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFScan.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFScan.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFScan.c  -o ${OBJECTDIR}/_ext/829574130/WFScan.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFScan.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFScan.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o: ../libs/tcpip/WiFi/WFConnectionProfile.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConnectionProfile.c  -o ${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConnectionProfile.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o: ../libs/tcpip/WiFi/WFConsoleIfconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFConsoleIfconfig.c  -o ${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFConsoleIfconfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFPowerSave.o: ../libs/tcpip/WiFi/WFPowerSave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFPowerSave.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFPowerSave.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFPowerSave.c  -o ${OBJECTDIR}/_ext/829574130/WFPowerSave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFPowerSave.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFPowerSave.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o: ../libs/tcpip/WiFi/WFDriverCom_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/829574130" 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o.d 
	@${RM} ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/WiFi/WFDriverCom_24G.c  -o ${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/829574130/WFDriverCom_24G.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o: ../libs/tcpip/ETHPIC32ExtPhyDP83640.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhyDP83640.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83640.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Hashes.o: ../libs/tcpip/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Hashes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Hashes.c  -o ${OBJECTDIR}/_ext/1357241782/Hashes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Hashes.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Hashes.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Telnet.o: ../libs/tcpip/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Telnet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Telnet.c  -o ${OBJECTDIR}/_ext/1357241782/Telnet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Telnet.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Telnet.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DNSs.o: ../libs/tcpip/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNSs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNSs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DNSs.c  -o ${OBJECTDIR}/_ext/1357241782/DNSs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DNSs.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DNSs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Announce.o: ../libs/tcpip/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Announce.c  -o ${OBJECTDIR}/_ext/1357241782/Announce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Announce.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Announce.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UDP.o: ../libs/tcpip/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UDP.c  -o ${OBJECTDIR}/_ext/1357241782/UDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UDP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UDP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Reboot.o: ../libs/tcpip/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Reboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Reboot.c  -o ${OBJECTDIR}/_ext/1357241782/Reboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Reboot.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Reboot.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ENC28J60.o: ../libs/tcpip/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ENC28J60.c  -o ${OBJECTDIR}/_ext/1357241782/ENC28J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ENC28J60.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ENC28J60.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNMP.o: ../libs/tcpip/SNMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNMP.c  -o ${OBJECTDIR}/_ext/1357241782/SNMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNMP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNMP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/StackTsk.o: ../libs/tcpip/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/StackTsk.c  -o ${OBJECTDIR}/_ext/1357241782/StackTsk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/StackTsk.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/StackTsk.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o: ../libs/tcpip/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/BerkeleyAPI.c  -o ${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/BerkeleyAPI.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/IP.o: ../libs/tcpip/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/IP.c  -o ${OBJECTDIR}/_ext/1357241782/IP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/IP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/IP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o: ../libs/tcpip/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhyDP83848.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhyDP83848.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/FileSystem.o: ../libs/tcpip/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FileSystem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FileSystem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/FileSystem.c  -o ${OBJECTDIR}/_ext/1357241782/FileSystem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/FileSystem.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/FileSystem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/TCP.o: ../libs/tcpip/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/TCP.c  -o ${OBJECTDIR}/_ext/1357241782/TCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/TCP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/TCP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SPIFlash.o: ../libs/tcpip/SPIFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIFlash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SPIFlash.c  -o ${OBJECTDIR}/_ext/1357241782/SPIFlash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SPIFlash.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SPIFlash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Helpers.o: ../libs/tcpip/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Helpers.c  -o ${OBJECTDIR}/_ext/1357241782/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Helpers.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Helpers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o: ../libs/tcpip/SNMPv3USM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNMPv3USM.c  -o ${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNMPv3USM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ARCFOUR.o: ../libs/tcpip/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ARCFOUR.c  -o ${OBJECTDIR}/_ext/1357241782/ARCFOUR.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ARCFOUR.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ARCFOUR.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Random.o: ../libs/tcpip/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Random.c  -o ${OBJECTDIR}/_ext/1357241782/Random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Random.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Random.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DHCP.o: ../libs/tcpip/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DHCP.c  -o ${OBJECTDIR}/_ext/1357241782/DHCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DHCP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DHCP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/BigInt.o: ../libs/tcpip/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BigInt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/BigInt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/BigInt.c  -o ${OBJECTDIR}/_ext/1357241782/BigInt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/BigInt.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/BigInt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/LCDBlocking.o: ../libs/tcpip/LCDBlocking.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/LCDBlocking.c  -o ${OBJECTDIR}/_ext/1357241782/LCDBlocking.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/LCDBlocking.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/LCDBlocking.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SSL.o: ../libs/tcpip/SSL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SSL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SSL.c  -o ${OBJECTDIR}/_ext/1357241782/SSL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SSL.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SSL.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o: ../libs/tcpip/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32IntMac.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32IntMac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ICMP.o: ../libs/tcpip/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ICMP.c  -o ${OBJECTDIR}/_ext/1357241782/ICMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ICMP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ICMP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o: ../libs/tcpip/eth_pic32_ext_phy_rtl8201FL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/eth_pic32_ext_phy_rtl8201FL.c  -o ${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/eth_pic32_ext_phy_rtl8201FL.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o: ../libs/tcpip/SPIEEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SPIEEPROM.c  -o ${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SPIEEPROM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DHCPs.o: ../libs/tcpip/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DHCPs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DHCPs.c  -o ${OBJECTDIR}/_ext/1357241782/DHCPs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DHCPs.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DHCPs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o: ../libs/tcpip/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/TCPPerformanceTest.c  -o ${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/TCPPerformanceTest.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETH97J60.o: ../libs/tcpip/ETH97J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETH97J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETH97J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETH97J60.c  -o ${OBJECTDIR}/_ext/1357241782/ETH97J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETH97J60.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETH97J60.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DNS.o: ../libs/tcpip/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DNS.c  -o ${OBJECTDIR}/_ext/1357241782/DNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DNS.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SPIRAM.o: ../libs/tcpip/SPIRAM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SPIRAM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SPIRAM.c  -o ${OBJECTDIR}/_ext/1357241782/SPIRAM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SPIRAM.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SPIRAM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Tick.o: ../libs/tcpip/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Tick.c  -o ${OBJECTDIR}/_ext/1357241782/Tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Tick.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Tick.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/TFTPc.o: ../libs/tcpip/TFTPc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/TFTPc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/TFTPc.c  -o ${OBJECTDIR}/_ext/1357241782/TFTPc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/TFTPc.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/TFTPc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/RSA.o: ../libs/tcpip/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/RSA.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/RSA.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/RSA.c  -o ${OBJECTDIR}/_ext/1357241782/RSA.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/RSA.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/RSA.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNTP.o: ../libs/tcpip/SNTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNTP.c  -o ${OBJECTDIR}/_ext/1357241782/SNTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNTP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNTP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/NBNS.o: ../libs/tcpip/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/NBNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/NBNS.c  -o ${OBJECTDIR}/_ext/1357241782/NBNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/NBNS.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/NBNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SMTP.o: ../libs/tcpip/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SMTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SMTP.c  -o ${OBJECTDIR}/_ext/1357241782/SMTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SMTP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SMTP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ENCX24J600.o: ../libs/tcpip/ENCX24J600.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ENCX24J600.c  -o ${OBJECTDIR}/_ext/1357241782/ENCX24J600.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ENCX24J600.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ENCX24J600.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ARP.o: ../libs/tcpip/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ARP.c  -o ${OBJECTDIR}/_ext/1357241782/ARP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ARP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ARP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UART.o: ../libs/tcpip/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UART.c  -o ${OBJECTDIR}/_ext/1357241782/UART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UART.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UART.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/SNMPv3.o: ../libs/tcpip/SNMPv3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/SNMPv3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/SNMPv3.c  -o ${OBJECTDIR}/_ext/1357241782/SNMPv3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/SNMPv3.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/SNMPv3.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/FTP.o: ../libs/tcpip/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/FTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/FTP.c  -o ${OBJECTDIR}/_ext/1357241782/FTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/FTP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/FTP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o: ../libs/tcpip/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhy.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhy.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/AutoIP.o: ../libs/tcpip/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/AutoIP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/AutoIP.c  -o ${OBJECTDIR}/_ext/1357241782/AutoIP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/AutoIP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/AutoIP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o: ../libs/tcpip/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UDPPerformanceTest.c  -o ${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UDPPerformanceTest.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o: ../libs/tcpip/ZeroconfHelper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ZeroconfHelper.c  -o ${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ZeroconfHelper.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o: ../libs/tcpip/UART2TCPBridge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/UART2TCPBridge.c  -o ${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/UART2TCPBridge.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/MPFS2.o: ../libs/tcpip/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/MPFS2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/MPFS2.c  -o ${OBJECTDIR}/_ext/1357241782/MPFS2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/MPFS2.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/MPFS2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o: ../libs/tcpip/ETHPIC32ExtPhySMSC8700.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhySMSC8700.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8700.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/HTTP2.o: ../libs/tcpip/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/HTTP2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/HTTP2.c  -o ${OBJECTDIR}/_ext/1357241782/HTTP2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/HTTP2.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/HTTP2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o: ../libs/tcpip/ETHPIC32ExtPhySMSC8720.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ETHPIC32ExtPhySMSC8720.c  -o ${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ETHPIC32ExtPhySMSC8720.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/DynDNS.o: ../libs/tcpip/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/DynDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/DynDNS.c  -o ${OBJECTDIR}/_ext/1357241782/DynDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/DynDNS.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/DynDNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o: ../libs/tcpip/ZeroconfMulticastDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ZeroconfMulticastDNS.c  -o ${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ZeroconfMulticastDNS.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/Delay.o: ../libs/tcpip/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/Delay.c  -o ${OBJECTDIR}/_ext/1357241782/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/Delay.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/Delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o: ../libs/tcpip/ZeroconfLinkLocal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1357241782" 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../libs/tcpip/ZeroconfLinkLocal.c  -o ${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1357241782/ZeroconfLinkLocal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/escherPWM.o: src/escherPWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/escherPWM.o.d 
	@${RM} ${OBJECTDIR}/src/escherPWM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/escherPWM.c  -o ${OBJECTDIR}/src/escherPWM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/escherPWM.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/escherPWM.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/escherSerial.o: src/escherSerial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/escherSerial.o.d 
	@${RM} ${OBJECTDIR}/src/escherSerial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/escherSerial.c  -o ${OBJECTDIR}/src/escherSerial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/escherSerial.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/escherSerial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/escherUDP.o: src/escherUDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/escherUDP.o.d 
	@${RM} ${OBJECTDIR}/src/escherUDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/escherUDP.c  -o ${OBJECTDIR}/src/escherUDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/escherUDP.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/escherUDP.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/play_pulses.o: src/play_pulses.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/play_pulses.o.d 
	@${RM} ${OBJECTDIR}/src/play_pulses.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/play_pulses.c  -o ${OBJECTDIR}/src/play_pulses.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/play_pulses.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/play_pulses.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/rhea.o: src/rhea.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rhea.o.d 
	@${RM} ${OBJECTDIR}/src/rhea.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rhea.c  -o ${OBJECTDIR}/src/rhea.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/rhea.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/rhea.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/rhea_timer4.o: src/rhea_timer4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rhea_timer4.o.d 
	@${RM} ${OBJECTDIR}/src/rhea_timer4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rhea_timer4.c  -o ${OBJECTDIR}/src/rhea_timer4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/rhea_timer4.o.d"        -g -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"src" -I"../../../libs/" -I"../../../libs/escher" -I"../../../libs/tcpip" -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/rhea_timer4.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/enSecOsc.o: src/enSecOsc.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/enSecOsc.o.d 
	@${RM} ${OBJECTDIR}/src/enSecOsc.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  src/enSecOsc.s  -o ${OBJECTDIR}/src/enSecOsc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/src/enSecOsc.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/src/enSecOsc.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/src/enSecOsc.o: src/enSecOsc.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/enSecOsc.o.d 
	@${RM} ${OBJECTDIR}/src/enSecOsc.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  src/enSecOsc.s  -o ${OBJECTDIR}/src/enSecOsc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/src/enSecOsc.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/src/enSecOsc.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DRHEA16 -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/RheaPlayer.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
