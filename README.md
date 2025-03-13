---
title: "Hiking Band: Software Requirements Specification"
author: 
- name: Holappa, Heidi 
- name: Lundén, Jaakko-Juhani
- name: Rislakki, Tuomas
abstract: ELEC-E8408 Embedded Systems Development, Aalto University. Group I.
lang: en
format: gfm
header-includes:
  - \usepackage{caption}
  - \captionsetup[figure]{font=scriptsize}  # This sets the font size for figure captions.
numbersections: true
toc: true
toc-depth: 2
# To render document use `quarto render README.md --to pdf`

# 1. Introduction

# Good Points:
# Clearly defines the purpose of the document, including its role in development, integration, and testing.
# Explicitly mentions the intended audience, including product developers and course instructors.
# Scope provides a broad understanding of the product, including both hardware (LilyGo smartwatch, Raspberry Pi) and software components.
# Definitions, acronyms, and abbreviations are detailed and well-organized.
# References are properly cited, with standards like IEEE 830 and RFC-2119 included.

# Missing Elements / Areas for Improvement:
# DONE: The purpose section could clarify how the document will be maintained or updated during the project's lifecycle.
# DONE: The definitions section could include technical terms related to data storage, synchronization, and security protocols.
# DONE: The references should follow a consistent format, specifying document titles, dates, and sources.

# 2. Overall Description

# Good Points:
# The product perspective is well-defined, showing interactions between hardware and software.
# Includes a block diagram to illustrate system components and interconnections.
# Defines user characteristics, distinguishing between technical and non-technical users.
# Lists constraints, including hardware limitations and communication protocols.

# Missing Elements / Areas for Improvement:
# DONE: The assumptions and dependencies section should state how the system handles failures in connectivity or power loss.
# DONE: Apportioning requirements should be more informative regarding the later stage design implementation.

# 3. Specific Requirements

# Good Points:
# Functional requirements are structured for both smartwatch and web application.
# Requirements use clear keywords (MUST, SHOULD, MAY), making priorities explicit.
# Performance requirements include measurable values, such as screen refresh rates and synchronization limits.
# Reliability and security considerations are included.

# Missing Elements / Areas for Improvement:
# No mention of traceability, linking each requirement to testable criteria.
# Lack of specific security protocols (e.g., Bluetooth encryption, authentication mechanisms).
---

{{< pagebreak >}}

# Introduction

This chapter highlights the purpose and scope of this document, introduces the essential definitions, acronyms and abbreviations, and lists the relevant references. 

## Purpose

The purpose of this document is to list requirements and provide context and considerations for the proof-of-concept Hiking Band product system. This document is intented be used within software development, integration and testing of the whole system.  

The core audiences for this documents are the product development team and the course instructors, who both review this document and review the final system based on the requirement specification of this document. The finished deliverable MUST match the specification in this documentation. 

The SRS is maintained in GitHub remote repository that provides version control. Each release of the Hiking Band system is tagged with a version number and this includes the documentation as well. This way the documentation is also version controlled and the revision history can be efficiently be reviewed with `git blame`, which shows change history and author of each change, with timestamps.  

For each release the SRS SHOULD be updated and represent the current version of the system. The SRS SHOULD also align with User Manual and Design Report in each release. With version control it is also easy to review removed sections of SRS. The SRS should have an Appendix that lists deprecated sections and in which release these sections were removed from the SRS. This way it is easy to find the deprecated sections from past releases, when necessary. 



## Scope

**The LilyGo Hiking band system** includes a LilyGO T-Watch smartwatch application for recording hiking trips and a separate application for storing trip information into persistent storage and for displaying trip information on a Web Application.  

This proof-of-concept system consists of two hardware components: the Raspberry Pi and the LilyGo watch. The system includes interactable interfaces, hardware, protocols and functionalities which are required for the system to function. This document defines the requirements in detail to give a broad understanding of the product and its use case. 


## Definitions, acronyms and abbreviations

### Definitions

**1.user:** the person, or persons, who operate or interract directly with the product.  

**2.hiking session:** an event during which activity data such as step count, travelled distance and average speed are recorded on the LilyGO smartwatch. The event begins when user pushes "Start" button and ends when user presses "End" button in hiking session view.  

**3.step:** An act or movement of putting one leg in front of the other in walking or running.  

**4.step count:** An approximation of taken steps computed by a step algorithm based on BMA423 accelerometer data.  

**5.distance:** An approximation of travelled distance in kilometers.  

**6.duration:** A count of seconds from the moment counting steps began, based on the RTC module of LilyGO.  

**7.average speed:** An average based on the duration of the hiking session and travelled distance.  

**8.burned calories:** an approximation of calories burned.  

**9.web application:** The application running on the Raspberry Pi including the database and hosting services.  

**10.LilyGo application:** The firmware and applications running on the LilyGo T-Watch smartwatch.  

**11.System:**  The whole system including Raspberry Pi, LilyGo T-Watch smartwatch and relevant interfaces.  

**12.Proof-of-concept:** a pilot project demonstrating that a design concept is feasible.  

**13.SUD:**  System Under Development.  

**14.data storage:** A local database created and accessed by the Web Application. The purpose of the data storage is to store data for past hiking sessions and the information of the paired LilyGO T-Watch.   

**15.session data:** Information stored from one hiking session, such as step count and distance in kilometers. 

**16.data tranfer:** A process in which session data is copied from LilyGO T-Watch application to persistent data storage on Web Application.

**17.polling:** An action in which client sends a request to a server. 

**18.request:** A communication from client to server in which client requests an operation from server. In context of Hiking Band system, the Web Application requests data from the LilyGO T-Watch application and the smartwatch application responds by sending data from hiking trips. 

**19.client:** A client is a device communicating with a server

**20.server:** Server is software service that listens to incoming requests and responds to them. 

**21.pairing:** A process in which two devices form an initial connection to enable communication

**22.synchronization:** An operation causing a set of data elements to remain identical in multiple locations. In the context of Hiking Band system synchronization means that session data from LilyGO T-Watch application is copied to persisten data storage on Web Application. Not all data on the persistent data storage MAY NOT be in the LilyGO T-Watch. 


### Requirement levels

This document uses requirement level keywords "MUST", "MUST NOT", "SHOULD", "SHOULD NOT" and "MAY". The keywords are used to coherently indicate blocking functionalities and requirements from optional and "nice to have" features. The keyword definitions respect the IETF RFC-2119 [2] standard:


| **Keyword** | **Definition** |
| --- | --- |
| MUST | Absolute requirement for the specification. |
| MUST NOT | Absolute prohibition of the specification. |
| SHOULD | Can be ignored with valid reasons. |
| SHOULD NOT | Can be implemented with valid reasons. |
| MAY | Optional, extra. |




## References

<!--
  Area of improvement
  The references should follow a consistent format, specifying document titles, dates, and sources.
-->

This Software Requirement Specification MUST be used in conjuction with the following publications:

[1] IEEE 830:1998 IEEE Recommended Practice for Software Requirements Specifications. Available at: [https://ieeexplore.ieee.org/document/720574](https://ieeexplore.ieee.org/document/720574)

[2] RFC-2119. Keywords for use in RFCs to Indicate Requirement Levels. Published in March, 1997. Available at: [https://datatracker.ietf.org/doc/html/rfc2119](https://datatracker.ietf.org/doc/html/rfc2119)

[3] RFC-7231. Hypertext Transfer Protocol (HTTP/1.1): Semantics and Content. Available at: [https://datatracker.ietf.org/doc/html/rfc7231](https://datatracker.ietf.org/doc/html/rfc7231)

[4] Barreira TV, Rowe DA, Kang M. Parameters of walking and jogging in healthy young adults. Int J Exerc Sci. 2010;3(1).

[5] Wilkin LD, Cheryl A, Haddock BL. Energy expenditure comparison between walking and running in average fitness individuals. J Strength Cond Res. 2012 Apr;26(4):1039-44. doi: 10.1519/JSC.0b013e31822e592c. PMID: 22446673.

The development team should familiarize with the following documents:

[i.] LilyGo T-Watch. LilyGo T-Watch GitHub repository. Available at: [https://github.com/Xinyuan-LilyGO/TTGO_TWatch_Library](https://github.com/Xinyuan-LilyGO/TTGO_TWatch_Library)

[ii.] ESPRESIF documentation. ESP32 Arduino Core's documentation. Available at: [https://docs.espressif.com/projects/arduino-esp32/en/latest/](https://docs.espressif.com/projects/arduino-esp32/en/latest/)




## Overview

This Software Requirements Specification (SRS) document is structured to provide a comprehensive outline of the Hiking Band System and of its requirements. The structure is based on the IEEE 830:1998 standard and is organized by the best practices introduced in IEEE 830:1998 as described below. 

### Content of the SRS

This SRS has three sections:  

1. **Introduction:** This section provides an overview of the entire SRS. It clarifies the context and the objectives of the Hiking Band System and details essential terminology and references.  
2. **Overall description:** This section provides a high-level overview of the SUD (System Under Development). It details the product functionalities, product perspective, constraints and user characteristics.  
3. **Specific Requirements:** This section delves deeper into the technical details of the SUD. It defines the performance requirements, design constraints, software-system attributes and security considerations. 

### Organization of the SRS

This SRS follows the structure recommended in IEEE 830:1998. Each section builds upon previous sections, ensuring that readers gain solid understanding of the System Under Design (SUD).  

1. **Introduction:** Gives an overview of the product, key terminology and details the purpose and the scope of this SRS  
2. **Overall description:** Provides an extensive overview of the systems requirements and constraints  
3. **Specific Requirements:** Breaks the system down into requirements that can be measured and verified based on preset metrics, ensuring that meeting the requirements can be verified during development and testing stages. 

{{< pagebreak >}}

# Overall description

## Product perspective

The product perspective states individual components and their connections within the system. 

![Block diagram showing the major components of the full system and the interconnections between its components. ](dev-doc/consept-overview.png "Block diagram of the system.")

> Note: In the above image, naming and other visualizations used MAY not convey the actual final product. However the interconnections and protocols SHOULD represent the actual system.

Using the above block diagram of the whole system we can divide the interfaces to subsections:

The [System interfaces](#system-interfaces) section lists the methods for software to interact with external systems and between major components. 

The [User interfaces](#user-interfaces) section lists the characteristics between the software and the user. 

The [Hardware interfaces](#hardware-interfaces) section lists the characteristics between hardware and software.

The [Software interfaces](#software-interfaces) section lists the characteristics between different software and applications within the system.

The [Communications interfaces](#communications-interfaces) section lists the externally defined communication protocols and their version used within the system.

### System interfaces

The data exchange between the major components MUST happen with structured and coherent application level protocols:

- HTTP and tcp/ip protocols between the web browser and the Web Application
- HTTP-like protocol between the Web Application and the LilyGo Application

The Web Application and the LilyGo Application SHOULD use json format to exchange information.

The LilyGo Application SHOULD use the json structure for the retrieved data when applicable:

![json structure for mini restful to communicate with the LilyGo Application  ](dev-doc/mini_restful_jsonstructure.png "Mini restful.")

For example for /tripdata/4:
```console
{
    "Context": "/tripdata/4",
    "Description": "Individual trip data overview.",
    "Data": {
        "ID": 4,
        "StartTimestamp": "0",
        "EndTimestamp": "0",
        "Steps": 0,
        "AvgSpeed": "0.000000",
        "GeoLocationPath": null
    }
}
```

The communication between Web Application and LilyGo Application MUST adhere to RFC-7231 when using GET and POST methods to inform the nature of the communication.

The communication between Web Application and LilyGo Application SHOULD use the command structure:

![Command structure for mini restful to communicate with the LilyGo Application ](dev-doc/mini_restful_commandstructure.png "Mini restful.")

Example for GET (example might not be applicable in the final product):
```console
GET /tripdata/4
```

Example for POST (example might not be applicable in the final product):
```console
POST {} /tripdata/4/clear
```

The communication between Web Application and LilyGo Application SHOULD use the filestructure:

![File structure for mini restful to communicate with the LilyGo Application  ](dev-doc/mini_restful_filestructure.png "Mini restful.")


The LilyGo Application SHOULD NOT execute its functions without interaction from the user or the Web Application. This means the LilyGo Application has only slave-like properties within the system.

The Web Application SHOULD be able to interact with its resources and the system independently.

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

The LilyGO application MUST use the BMA423 using the pinout defined by LilyGO hardware:

- Interrupt: 39 pin

The WebUI HTML layout MUST be viewable in a web browser on Raspberry Pi. In this context viewable means that the user MUST be able to read all information rendered on a web page

The WebUI HTML layout MAY be viewable on a mobile phone screen. 

### Software interfaces

The LilyGO application SHOULD use LilyWatch maintained TTGO_TWatch_Library and Arduino core ESP32 libraries for the pin definitions and driver implementation 

The LilyGO application SHOULD be implemented with the following state machine for a polling scheduler of 6 orthogonal processes. The timing and prioritization MAY be changed to accommodate other requirements:

![Polling scheduler example for the LilyGO application](/dev-doc/polling-scheduler.png "Polling scheduler example for the LilyGO application")

The Web application SHOULD follow simple polling scheduling of tasks.

The Web application SHOULD use SQLite to store synchronized data locally on the RPi

The Web application MUST atleast implement the functionality of the following UML in within the program:

![Minimum SQL database on the Web application](/dev-doc/sql-UML.png "UML of the SQL database on the Web application")

### Communications interfaces

The BlueTooth capabilities MUST use the BlueTooth version v4.2 or below

The Web Application MUST use HTTP and TCP/IP procotols to be able to view the WebUI

The Web Application MUST have ONE of the following capabilities to view the WebUI:

- Able to host its own WiFi access point
- Connect to a local network via WiFi by configuring the correct SSID information
- Connect to a local network via Ethernet by acquiring IP and network information from DHCP.

## Product functions
This subsection contains the functional requirements for the Hiking Application prototype. As the prototype consists of both LilyGo - application and the Web application to present tracking data, the functional requirements gather requirements for both of these.  

### LilyGo application: Start & stop hiking sessions

The system MUST allow user to start a hiking session  

The system MUST allow user to stop a hiking session  

The system MAY allow user to continue stopped hiking session

The system MAY prevent starting a new hiking session, if real-time clock of the smartwatch is compromized. In this case, the smartwatch must be first synchronized with RPi to synchronize the real-time clock. 

### LilyGo application: Recording multiple hiking sessions

The system MUST allow user to record multiple hiking sessions to smartwatch memory 

The system MUST store at minimum 5 last sessions in running memory of the smartwatch

The system MAY store at minimum 5 last sessions in persistent memory of the smartwatch

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

The smartwatch application MUST at the minimum be able to connect to RPi based on Bluetooth broadcast device name of the LilyGo T-Watch

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

### Calculating data

Travelled distance MUST be based either on an approximation of the length of an average step or on GPS data   

Approximation of burned calories MUST be based on count of steps and MAY additionally be based on average speed during the trip.   

## User characteristics

This Software Requirements Specification details the features for the proof-of-concept (PoC) version of the system under design (SUD). The system SHOULD be in a stage, in which users with intermediate technical skills with Smartwatches, Bluetooth technology and Raspberry Pi product family can use the product indepentently with the help of the project documentation.  

With the help of the documentation the user MUST be able to know how to 

- clone source code from remote repository (GitHub)
- how to set up virtual environment and install dependencies
- how to flash firmware on LilyGO T-Watch

## Constraints

The constraints mentioned are only concerning the software of the application, as they are the only ones liable to change. The hardware specifications are set due to the predefined hardware that will be used and as such would only be repeating what the specifications for the different parts are. The hardware used can be found in the hardware interfaces section.

### System interfaces

- The TWatch has a touchscreen that works as the user interface
- The RPi has a monitor, mouse and keyboard setup that works as a user interface
- The interface between the RPi and TWatch is a Bluetooth connection

### User interfaces

#### TWatch touchscreen interfaces.

- Default interface, has navigation buttons for viewing past sessions, opening the settings menu and moving to the session screen.
- Settings interface, has buttons for configuring the bluetooth connection
- Past sessions interface, contains the current past 5 sessions
- Session interface, has the start and stop session buttons. Shows the current stats for the session.

#### WebUI interfaces

- Home screen shows top and average values of trips and the last trip you have done
- View with a list of all trips, every trip can be deleted from this view
- Configuration view where the setup for the BT connection is and with what intervalls the RPi tries to connect to it

### Hardware interfaces

- WebUI software will run on a RPi 3 and utilize a standard monitor, mouse and keyboard setup.
- The hiking app will use a TWatch v2. If modified a bit it can also use the versions v1 and v3, if the GPS is disabled.

### Software interfaces

- No external softwares required

### Communications interfaces

- The WebUI can be viewed by connecting to the RPi with RealVNC Viewer over the same network using standard network protocols or by using the display, keyboard and mouse connected to the RPi
- The RPi and the TWatch communicate over Bluetooth using a JSON format

### Memory

- The TWatch will only save 5 trips before it starts rewriting the previous information
- The trips will be saved in flash memory

### Operations

- The user will have to first setup the connection between the RPi and the TWatch before being able to synchronize them
- The user will have to synchronize the Watch after the battery runs low enough that the system clock becomes unreliable
- The user will have to synchronize the Watch before they run out of space for trips that have not been synchronized

### Site adaptation requirements

- The current scope of the project does not see it being used anywhere else, so no additional requirements are necessary

## Assumptions and dependencies

<!--
  Area of improvement
  The assumptions and dependencies section should state how the system handles failures in connectivity or power loss.
-->

### Operational assumptions

- The clock is either recharged or synchronized regularly between trips to ensure that the real-time clock module is operational. If the clock runs out of battery life, user may not be able to record new hiking sessions. 
- The Raspberry Pi is connected to a home network with an IP address.
- The home network does not restrict the use of TCP port 5000
- The Raspberry Pi has access to internet
- All software and firmware has been installed according to the provided installation manual
- The versions of the web application and the hiking application are the same
- The Web application handles the listed exceptions and errors without system failure:

| Exception name | Description | Responsible platform |
| -------------- | ----------- | -------------------- |
| Bluetooth out of range | When smartwatch application is out of range during synchronization. System SHOULD normally carry on operation. | Web Application |
| Bluetooth setup incomplete | Incorrect or wrong MAC or new smartwatch application. Renewing Bluetooth setup is required. | Web Application |
| Power outage | Web Application is forced to restart by power loss | Web Application |
| smartwatch application out of battery | This will not affect the system. Smartwatch application related data SHOULD be reset. Web Application knows which data is already synced from marking. | Web Application / smartwatch application |


### Hardware assumptions

- The LilyGo hiking application requires LilyGO T-Watch V2
- The Web Application requires Python 3.10 or higher
- The web application is only guaranteed to work on Raspberry Pi3 

## Apportioning of requirements

<!--
  Area of improvement:
  Apportioning requirements should be more informative regarding the later stage design implementation.
-->
Apportioning of requirements subsection conveys late stage considerations related to the requirement levels. Requirements follow the selected keywords defined in the [Requirement levels](#Requirement-levels) subsection. 

### Requirement prioritization

The proof-of-concept (PoC) MUST include all requirements that have been defined with keywords MUST according to RFC-2119 [2]. All requirements marked with key word MAY are not guaranteed to be implemented in the PoC release. For requirements with keyword SHOULD, design team must be able to justify deviation from SRS. 

In the later stage design and initial releases, careful attention MUST be given to these aspects of this document:

1. Synchronization: Fluent, does not give any errors unknown error to the user and the other requirements are carefully inspected.
2. Web Application UI: Usage is fluent, database entries are easily inspected and deleted, database is clearly visualized and the other requirements are carefully inspected. 
3. Smartwatch application: Clock is easily usable, data collected is correct, timestamps are correct, synchronization is fluent and the other requirements are carefully inspected. 

Difficult but convenient requirements that SHOULD be carefully considered in the initial releases due to time constraints:

1. GPS and other related functionality
2. Persistent storage on the smartwatch application
3. Clock / timestamp offset related on the smartwatch application

{{< pagebreak >}}

# Specific Requirements

<!--
  Areas of improvement:
  No mention of traceability, linking each requirement to testable criteria.
  Lack of specific security protocols (e.g., Bluetooth encryption, authentication mechanisms).
-->

## Performance Requirements

- The RPi MUST support at least 1 LilyGo watch at a time.

- The maximum time for trips MUST be above 2h.

- The watch MUST log the location either every 10 or 30 seconds, depending on memory size.

- The watch MUST have room for 5 trips.

- The synchronization for transfering data to the RPi MUST not fail 2 times in a row.

- The watch refreshes the screen in the trip view every 0.2 seconds or faster.

- The trip data MUST be saved on the watch until it is the oldest trip before being overwritten.

- Trip data MUST not be overwritten before it has been synchronized.

- Changing the view on the RPi MUST be faster than 0.5 seconds.

## Design Constraints

Design constraints specify good to know requirements and constraining factors. These might impose difficulties for the integration and software development. Consider these factors affecting multiple functionalities and requirements.

### The LilyGo application: Scheduling

The system handles multiple different tasks from multiple interfaces which MUST be scheduled accordingly so the performance requirements are met.

### The LilyGo application: Hardware restriction

The LilyGo application MUST be carefully crafted to account for the hardware restrictions of the T-Watch V2: 

| Restricting factor | Size |
| ------------------ | ---- |
| Flash memory |  16MB |
| PSRAM |  8 MB |
| SRAM | 520 KB |

### The Web application: Network access

The network access of the RPi MUST be made easily configurable and NOT hardcoded to work in one network. 

The system is designed so the RPi OS SHOULD be only be interacted by the WebUI. This also imposes difficulty in the configuration of the network access.  

### The Web application: Synchronization 

The bluetooth interaction the minimum requirements SHOULD use the hard coded BlueTooth broadcast name to determine the correct device. It would be a lot more secure if we can do this from the WebUI without hardcoding. However, this requires more precise interaction with the operating system and the Web Application.

If the clock runs out of sync due to power loss the system MUST synchronize its time when syncing to the RPi. The system needs to be aware of this. As the LilyGo application functions has only slavelike properties this requires more action from the RPi.


### Data calculation

In case the optional GPS tracking functionality is not implemented, the length of one step is hard coded as an approximation of average stride length. The value will be based on an equation referenced by Barreira et. al [4]: 42 percent of the person's height. The average height of males in Finland is 180 cm. Thus the average stride length for an average length Finnish male would be  

$$0.42 \cdot 180\,cm = 75.6 cm = 0.756\,m \approx 0.76\,m$$  

In case GPS tracking data is unavailable, travelled distance is simply calculated by  

$$\text{stepCount} \times \text{strideLength}$$  

The calory calculation is based on Wilkin et. al. [5] findings on average energy expenditure for young average health adults. Their findings have been applied to suit the metric system and by converting Kilojoules into calories by using the conversion of 1 kilojoule equalling 239 calories. With this process the calory consumption for 1 km hike is estimated to be 56 calories and thus calory consumption per step is  

$$0.00076 km \cdot 56 = 0.04256\,\text{calories}$$ 




## Software-system attributes

### Reliability

- In case GPS data is tracked, the system MUST log and save the current location in periodically (15s)
- In above mentioned case the system MUST NOT miss 2 consecutive loggings of location data

### Security

- The LilyGo watch MUST only send hiking data to a paired device
- The LilyGo watch MUST only be discoverable during pairing with the RPi
- The RPi MUST periodically check if the watch is within range, the LilyGo MUST NOT attempt to connect to the RPi automatically

