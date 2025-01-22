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

<Context Diagram place holder>

# Specific Requirements

## Functional Requirements
This subsection contains the functional requirements for the Hiking Application 

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

