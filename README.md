# MedicalApp: Secure E-Health Appointment System

This repository contains **MedicalApp**, a secure web application for managing medical appointments. It was developed as the final project for the "Information Systems Security & Web Programming" course. The primary focus of this project is applying "Security by Design" principles to protect sensitive medical data and ensure GDPR compliance.

**Author:** Antonios Bardanis (Registration Number: P21110)

## 🛠️ Technology Stack & Architecture
The application strictly follows a **3-Tier Architecture**:
* **Presentation Tier:** JavaServer Pages (JSP) and Bootstrap 5.
* **Application Tier:** Java Servlets running on the Apache Tomcat 10.1 Web Container.
* **Data Tier:** MySQL 8.0 relational database (`medical_db`)[cite: 4, 5].

## ✨ Core Features
The system implements Role-Based Access Control (RBAC) with three distinct user categories:
* **Patients:** Can register, search for doctors by specialty, book appointments, and view their visit history.
* **Doctors:** Can manage their availability schedule and view the list of patients who have booked appointments.
* **Admins:** Responsible for registering new doctors into the system and overseeing general operations.

## 🛡️ Security Implementations
To mitigate risks highlighted in the OWASP Top 10, the following security countermeasures were technically implemented:

* **SSL/TLS Encryption (Data in Transit):** All client-server communication is forced over HTTPS (port 8443) using an RSA 2048-bit self-signed certificate (`mykeystore.jks`)[cite: 4, 7].
* **Secure Authentication (Data at Rest):** User passwords are not stored in plain text. They are hashed using the **SHA-256** algorithm. The hashing mechanism also includes null-pointer protection to prevent system crashes during fuzzing attacks.
* **SQL Injection Prevention:** Universal use of parameterized queries (`PreparedStatement`) across all Data Access Objects (DAOs) to safely separate SQL logic from user input[cite: 4, 6].
* **Cross-Site Scripting (XSS) Protection:** Implemented a custom `SecurityUtils.sanitize` method for strict Output Encoding[cite: 4, 6]. It converts dangerous HTML characters into safe entities before rendering dynamic content on JSPs.
* **HTTP Security Headers:** A custom Servlet Filter (`SecurityHeadersFilter`) automatically injects critical headers into all responses, including[cite: 4, 6]:
  * `Strict-Transport-Security` (HSTS)
  * `Content-Security-Policy` (CSP)
  * `X-Frame-Options` (Clickjacking protection)
  * `X-Content-Type-Options` (MIME sniffing prevention)
  * `Cache-Control` (No-store for sensitive pages)
* **Session Management:** Cookies are securely configured with `HttpOnly` and `Secure` flags.

## 🧪 Vulnerability Testing
The application's security posture was rigorously validated using **OWASP ZAP (Zed Attack Proxy) version 2.15**. Automated scanning, which included spidering and active attacks, resulted in **0 critical vulnerabilities**. The implemented countermeasures successfully reduced the initial high-risk threats (like SQLi and Sniffing) to an acceptable low-risk level.
