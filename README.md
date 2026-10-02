# Azure Landing Zone - Terraform

## Overview

This repository contains a modular Terraform implementation for building
an Azure Landing Zone.

The objective of this project is to provide a reusable and scalable
infrastructure foundation for Azure workloads using Infrastructure as Code
(IaC).

The infrastructure is divided into reusable child modules and a parent
module that consumes those modules.

---

## Architecture

The landing zone follows a modular architecture consisting of:

- Resource Groups
- Virtual Networks
- Subnets
- Network Security Groups
- Route Tables
- Azure Firewall
- Azure Bastion
- VNet Peering
- Public IP
- Network Interfaces
- Virtual Machines
- Load Balancer
- Azure Key Vault
- Azure Storage Account
- Storage Containers
- Storage Blobs
- Private Endpoints
- PostgreSQL Database

High-level architecture:

```text
                    Azure Landing Zone
                           |
             +-------------+-------------+
             |                           |
          Hub VNet                   Spoke VNet
             |                           |
      +------+-------+             +-----+------+
      |      |       |             |     |      |
   Firewall Bastion Routing       VM    LB   PostgreSQL
      |
    NSG
      |
   Subnets
      |
      +------------ VNet Peering ------------+
                                             |
                                      Private Endpoint
                                             |
                                    +--------+--------+
                                    |                 |
                                Key Vault          Storage
