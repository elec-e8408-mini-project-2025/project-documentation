---
title: "Hiking Band: Software Requirements Specification"
format: gfm
header-includes:
  - \usepackage{caption}
  - \captionsetup[figure]{font=scriptsize}  # This sets the font size for figure captions.
numbersections: true
# To render document use `quarto render README.md --to pdf`
---

**Course:** ELEC-E8408 Embedded Systems Development, Aalto University  
**Members:** Holappa, Heidi & Lundén, Jaakko-Juhani & Rislakki, Tuomas  
**Group:** I  

{{< pagebreak >}}

**Table of Contents**

1. [Introduction](#introduction)  
    i. [Purpose](#purpose)
    ii. [Scope](#scope)
    iii. [Definitions, acronyms, abbreviations](#definitions-acronyms-and-abbreviations)
    iv. [References](#references)
    v. [Context Diagram and Overview](#context-diagram-and-overview)
2. [Overall description](#overall-description)
    i. [Product Perspective](#product-perspective)
    ii. [Product functions](#product-functions)
    iii. [User characteristics](#user-characteristics)
    iv. [Constraints](#constraints)
    v. [Assumptions and dependencies](#asuumptions-and-dependencies)
    vi. [Apportioning of requirements](#apportioning-of-requirements)
3. [Specific Requirements](#specific-requirements)
    i. [Performance requirements](#performance-requirements)
    ii. [Design constraints](#design-constraints)
    iii. [Software-system attribtues](#software-system-attributes)

{{< pagebreak >}}

# Introduction

This chapter highlights the purpose and scope of this document, introduces the essential definitions, acronyms and abbreviations and the relevant references. 

## Purpose

The purpose of this document is to list and provide context and considerations for the Hiking Band product system. This document SHOULD be used within software development, integration and testing of the whole system.  

The core audiences for this documents are the product development team and the course instructors, who both review this document and review the final system in based on the requirement specification of this document. The final product MUST match this documentation. 


## Scope

The LilyGo Hiking band system includes a LilyGO T-Watch smartwatch application for recording hiking trips and a separate application for storing trip information into persistent storage and for displaying trip information on a Web Application.  

The system consists of two hardware components: the Raspberry Pi and the LilyGo watch. The system includes interactable interfaces, hardware, protocols and functionalities which are required for the system to function. This document defines the requirements in well detail to give a broad understanding of the product and its use case. 


## Definitions, acronyms and abbreviations

**1.user:** the person, or persons, who operate or interract directly with the product. 

**2.hiking session:** an event during which activity data such as step count, travelled distance and average speed are recorded on the LilyGO smartwatch. The event begins when user pushes "Start" button and ends when user presses "End" button in hiking session view

**3.step count:** An approximation of taken steps computed by a step algorithm based on BMA423 accelerometer data

**4.distance:** An approximation of travelled distance based on the product of a predefined length of average step and the step count

**5.average speed:** An average based on the duration of the hiking session and travelled distance

## Overview


### Abbreviations and Definitions

|     Abbreviation or Word      |      Definition                                                |
| ----------------------------- | -------------------------------------------------------------- |
| System                        | The whole system including Rpi, LilyGo and relevant interfaces |
| RPi                           | Raspberry Pi V3+                                               |
| LilyGo                        | Lilygo T-Watch V2                                              |
| LilyGo application            | The firmware and applications running on the LilyGo            |
| Web application               | The Web-based application running on the RPi                   |

### Keywords

The specification follows the requirement level keywords defined in [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119):

|     Keyword      |      Description for the specification     |
| ---------------- | ------------------------------------------ |
| MUST             | Absolute requirement for the specification |
| MUST NOT         | Absolute prohibition of the specification  |
| SHOULD           | Can be ignored with valid reasons          |
| SHOULD NOT       | Can be implemented with valid reasons      |
| MAY              | Optional, extra                            |



## References

This Software Requirement Specification shall be used in conjuction with the following publications:

[1] IEEE 830:1998 IEEE Recommended Practice for Software Requirements Specifications. https://ieeexplore.ieee.org/document/720574

[2] RFC-2119. Key words for use in RFCs to Indicate Requirement Levels. Published in March, 1997. Available at: https://datatracker.ietf.org/doc/html/rfc2119

The development team should familiarize with the following documents:

[i.] LilyGo T-Watch. LilyGo T-Watch GitHub repository. Available at: https://github.com/Xinyuan-LilyGO/TTGO_TWatch_Library

[ii.] ESPRESIF documentation. ESP32 Arduino Core's documentation. Available at: https://docs.espressif.com/projects/arduino-esp32/en/latest/




## Context Diagram and Overview

This document follows the SRS structure detailed in IEEE 830 section 5 [1]. Section 2 of this document lays out the over all description and section 3 the specific requirements, as detailed in IEEE 830. 

The image below details an overview of the system concept. 

![Initial Consept Overview](dev-doc/consept-overview.png "Initial Consept Overview")

# Overall description

## Product perspective

### System interfaces

This subsection expands and defines the frontends of the Web Application and LilyGO functionalities defined in [Functional Requirements](#functional-requirements).

The [User interfaces](#user-interfaces) section lists the characteristics between the software and the user. 

The [Hardware interfaces](#hardware-interfaces) section lists the characteristics between hardware and software.

The [Software interfaces](#software-interfaces) section lists the characteristics between different software and applications within the system.

### User interfaces

The LilyGO interface user MUST be able to interact with the functionalities:

- "start a hiking session"
- "stop a hiking session"
- "display step count on display"
- "display travelled distance on display"
- "record step count"
- Enable BlueTooth capabilities 

The LilyGO interface SHOULD follow the given interface layout:

![LilyGo Views](/dev-doc/app_views.png "concept of app views")


> Note: the GUI of the final product may not be a one to one match with the early visualization draft represented here. It will however meet the requirements for functionalities.


The Web UI interface user MUST be able to interact with the functionalities:

- "display a list of past sessions"
- "display the last session"

The Web UI interface SHOULD follow the given interface layout:

![Web UI views](/dev-doc/web_ui_view.png "concept of web view")

### Hardware interfaces

The LilyGO application MUST use the touchScreen FT6336 using the pinout defined by LilyGO hardware:

- SDA: 23 pin
- SCL: 32 pin
- Interrupt: 38 pin

The LilyGO application SHOULD use the BMA423 using the pinout defined by LilyGO hardware:

- Interrupt: 39 pin

The WebUI HTML layout MUST fit in a computer screen. 

The WebUI HTML layout MAY fit in a mobile phone screen. 

### Software interfaces

The LilyGO application SHOULD use LilyWatch maintained TTGO_TWatch_Library for the pin definitions and driver implementation 

The Web application SHOULD use SQLite to store synchronized data locally on the RPi

The Web application SHOULD use SQLite to store its information

### Communications interfaces

The synchronization SHOULD be able to happen only after initial setup between RPi and LilyGO

The synchronization via BlueTooth between RPi and LilyGO MUST happen via BlueTooth v4.2 or below

The WebUI MUST use http protocol within a local TCP/IP network.

The RPi MUST be able to connect to a local network OR host its own access point to view the WebUI

## Product functions
This subsection contains the functional requirements for the Hiking Application prototype. As the prototype consists of both LilyGo - application and the Web application to present tracking data, the functional requirements gather requirements for both of these.  

### LilyGo application: Start & stop hiking sessions

The system MUST allow user to start a hiking session  

The system MUST allow user to stop a hiking session  

The system MAY allow user to continue stopped hiking session

The system MAY prevent starting a new hiking session, if real-time clock of the smartwatch is compromized. In this case, the smartwatch must be first synchronized with RPi to synchronize the real-time clock. 

### LilyGo application: Recording multiple hiking sessions

The system MUST allow user to record multiple hiking sessions to smartwatch memory 

The system MUST store at minimum 5 last sessions in persistent memory of the smartwatch

The system MAY support storing more than 5 last sessions on the smartwatch

The system MAY warn user if memory capacity is full (max number of sessions have been stored to persistent memory)

The system MAY ask user to override older sessions  

The system MAY prohibit starting new session before memory capacity is released  

The system MAY override the oldest stored session when persistent memory is full

### LilyGo application: Record steps count and convert into travelled distance during the session

While hiking session is active, the system MUST record steps count  

While hiking session is active, the system MUST convert steps count into travelled distance every time data is rendered on touchscreen

### LilyGo application: Display this data on a smartwatch screen

While hiking session is active, the system MUST display step count on display  

While hiking session is active, the system MUST display travelled distance on display  

While hiking session is active, the system MAY display average speed on display

While the hiking session is active the step count and travelled distance MUST update regularly 

The update frequency of hiking session information MAY be optimized with best effort based on hardware constraints

While hiking session is not active, the touchscreen MAY display step count and travelled distance for last session on display

While hiking sessin is active, the smartwatch touchscreen MAY display the current date (YYYY-MM-DD) 

### Synchronize and store data with RPi via Bluetooth

The smartwatch application MUST be capable of sending step count and travelled distance via Bluetooth to the web application on RPi  

The smartwatch application MAY also send date of hike and average speed for each recorded hiking session

The smartwatch application MUST be able to connect to RPi with MAC address that is hard coded to RPi

The smartwatch application MAY be able to connect to RPi with LilyGo enabling Bluetooth discovery

The smartwatch application MAY be able connect to RPi by configured Wi-Fi connection

The smartwatch application MAY be able to find RPi with Wi-Fi discovery

### Calculate estimated amount of calories burned during the session on RPi

The system MUST calculate estimated amount of calories based on travelled distance

### Web application: Initialize Web UI and show last session statistics (travelled distance, step count and burned calories)

The system MUST display travelled distance, step count and burned calories for last session  

The system MUST contain a list of past sessions  

The displayed list of past sessions MUST contain travelled distance, step count and burned calories for each session  

The displayed list of past sessions MAY contain date for each session

The system MAY provide detail view for a chosen session where additional session information is presented

The system MAY provide delete feature for removing past sessions from persistent memory

## User characteristics

## Constraints

### System interfaces

### User interfaces

### Hardware interfaces

### Software interfaces

### Communications interfaces

### Memory

### Operations

### Site adaptation requirements

## Asuumptions and dependencies

- The clock is synchronized regularly between trips

## Apportioning of requirements


# Specific Requirements


## Performance Requirements

### MUST have acceptably long data synchronization

## Design Constraints

### MUST use atleast predefined hardware

- The system MUST use T-Watch V2

- The system MUST use raspberry pi 2, 3 or 3+

- The system MAY use other hardware

- If the clock runs out of sync due to power loss the system SHALL synchronize its time when syncing to the RPi

## Software-system Attributes

### Reliability

- The system MUST log and save the current activity in periodically (15s)
- The system MUST NOT miss 2 consecutive loggings

### Security

- The LilyGo watch SHALL only send hiking data to a paired device
- The LilyGo watch SHALL only be discoverable during pairing with the RPi
- The RPi SHALL periodically check if the watch is within range, the LilyGo SHALL NOT attempt to connect to the RPi automatically

