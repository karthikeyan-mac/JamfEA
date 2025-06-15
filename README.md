# Jamf Pro Extension Attributes

This repository contains a curated set of **Extension Attributes (EAs)** for use with [Jamf Pro](https://www.jamf.com/products/jamf-pro/). Extension Attributes allow Mac Admins to collect custom inventory data from managed devices, enabling advanced scoping, reporting, and automation.

## 🔍 What Are Extension Attributes?

Extension Attributes are custom scripts that return a value (e.g., string, integer, date) to Jamf Pro during inventory collection. These values can then be used in:

- Smart and static groups
- Advanced searches
- Policies and configuration profiles
- Reports and dashboards

## ⚙️ Usage

To use an Extension Attribute from this repository:

1. Open **Jamf Pro > Settings > Computer Management > Extension Attributes**.
2. Create a new Extension Attribute.
3. Paste the script content into the input field.
4. Choose the appropriate data type (e.g., String, Integer).
5. Save and test on a target device.

Each script includes comments and output expectations to help you understand its behavior.

## ⚠️ Disclaimer

> **Important:** Always test Extension Attribute scripts in a development or test environment before deploying them in production.
