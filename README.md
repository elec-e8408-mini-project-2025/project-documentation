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
    ii. [Definitions, acronyms, abbreviations](#definitions-acronyms-and-abbreviations)
    iii. [Context Diagram and Overview](#context-diagram-and-overview)
2. [Specific Requirements](#specific-requirements)
    i. [Functional Requirements](#functional-requirements)
    ii. [Interfaces](#interfaces)
    iii. [Performance Requirements](#performance-requirements)
    iv. [Design Constraints](#design-constraints)
    v. [Software-system Attributes](#software-system-attributes)

{{< pagebreak >}}

# Introduction

## Purpose

The purpose of this document is to list and provide context and considerations for the Hiking Band product. 

The document MAY provide overview level of the used integration methods for the system. However, the main scope of the specifications SHOULD be targeted towards the actual use case. 

## Definitions, acronyms and abbreviations

The specification follows the requirement level keywords defined in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119):

|     Keyword      |      Description for the specification     |
| ---------------- | ------------------------------------------ |
| MUST             | Absolute requirement for the specification |
| MUST NOT         | Absolute prohibition of the specification  |
| SHOULD           | Can be ignored with valid reasons          |
| SHOULD NOT       | Can be implemented with valid reasons      |
| MAY              | Optional, extra                            |



## Context Diagram and Overview

![Initial Consept Overview](dev-doc/consept-overview.png "Initial Consept Overview")

# Specific Requirements

## Functional Requirements
This subsection contains the functional requirements for the Hiking Application prototype. As the prototype consists of both LilyGo - application and the Web application to present tracking data, the functional requirements gather requirements for both of these.  

### LilyGo application: Start & stop hiking sessions

The system MUST allow user to start a hiking session  

The system MUST allow user to stop a hiking session  

The system MAY allow user to continue stopped hiking session

### LilyGo application: Recording multiple hiking sessions

The system MAY allow user to record multiple hiking sessions to smartwatch memory 

### LilyGo application: Record steps count and convert into travelled distance during the session

While hiking session is active, the system MUST record steps count  

While hiking session is active, the system MUST convert steps count into travelled distance after each step  

### LilyGo application: Display this data on a smartwatch screen

While hiking session is active, the system MUST display step count on display  

While hiking session is active, the system MUST display travelled distance on display  

While hiking session is not active, the system MAY display step count and travelled distance for last session on display

### Synchronize and store data with RPi via Bluetooth

The smartwatch application MUST be capable of sending hiking data via Bluetooth to the web application on RPi  

The smartwatch application MUST be able to connect to RPi with hard coded MAC address

The smartwatch application MAY be able to connect to RPi with Bluetooth discovery

The smartwatch application MAY be able to connect to RPi with Wi-Fi discovery

### Calculate estimated amount of calories burned during the session on RPi

The system MUST calculate estimated amount of calories based on travelled distance

### Web application: Initialize Web UI and show last session statistics (travelled distance, step count and burned calories)

The system MUST display travelled distance, step count and burned calories for last session  

The system MUST contain a list of past sessions  

The system will display a list of past sessions that MUST contain date, travelled distance, step count and burned calories for each session  

The system MAY provide detail view for a chosen session where additional session information is presented

The system MAY provide delete feature for removing past sessions from persistent memory

### MUST have user interface

- The system MUST provide instantaneous feedback on current activity

- The system MUST have a user interface with viewable calory and step count.

## Interfaces

## Performance Requirements

### MUST have acceptably long data synchronization

## Design Constraints

### MUST use atleast predefined hardware

- The system MUST use T-Watch V2 or V3

- The system MUST use raspberry pi 2, 3 or 3+

- The system MAY use other hardware 

## Software-system Attributes

### MUST be able to log reliably

- The system MUST log and save the current activity in periodically

