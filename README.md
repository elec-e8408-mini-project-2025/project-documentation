# Hiking Band: Software Requirements Specification

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to list and provide context and considerations for the Hiking Band product. 

The document MAY provide overview level of the used integration methods for the system. However, the main scope of the specifications SHOULD be targeted towards the actual use case. 

### 1.2 Definitions, acronyms and abbreviations

The specification follows the requirement level keywords defined in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119):

|     Keyword      |      Description for the specification     |
| ---------------- | ------------------------------------------ |
| MUST             | Absolute requirement for the specification |
| MUST NOT         | Absolute prohibition of the specification  |
| SHOULD           | Can be ignored with valid reasons          |
| SHOULD NOT       | Can be implemented with valid reasons      |
| MAY              | Optional, extra                            |



### 1.3 Context Diagram and Overview

<Context Diagram place holder>

## 2. Specific Requirements

### 2.1 Functional Requirements

#### 2.1.1 MUST have user interface

- The system MUST provide instantaneous feedback on current activity

- The system MUST have a user interface with viewable calory and step count.

### 2.2 Interfaces

### 2.3 Performance Requirements

#### 2.3.1 MUST have acceptably long data synchronization

### 2.4 Design Constraints

#### 2.4.1 MUST use atleast predefined hardware

- The system MUST use T-Watch V2 or V3

- The system MUST use raspberry pi 2, 3 or 3+

- The system MAY use other hardware 

### 2.5 Software-system Attributes

#### 2.5.1 MUST be able to log reliably

- The system MUST log and save the current activity in periodically

