# Lab 14: Elasticsearch Security Basics

## 📌 Lab Summary

In this lab, Elasticsearch security features were explored by creating a new user with limited privileges and assigning appropriate roles. The user's access permissions were verified in Kibana to ensure that only authorized indices could be accessed, demonstrating the fundamentals of Role-Based Access Control (RBAC) in Elasticsearch.

---

## 🎯 Objectives

- Understand Elasticsearch security basics.
- Create users with limited privileges.
- Assign roles and permissions.
- Verify user access in Kibana.
- Implement secure access to Elasticsearch indices.

---

## 🛠️ Lab Environment

- Ubuntu Server (AWS EC2)
- Elasticsearch 9.x
- Kibana 9.x
- Built-in Security (X-Pack)

---

# Step 1: Access Security Management

Logged in to Kibana using an administrator account.

Navigated to:

**Stack Management → Security → Users**

This section allows administrators to create and manage Elasticsearch users.

---

# Step 2: Create a New User

Created a new user with limited privileges.

Example:

- **Username:** `limited_user`
- **Password:** ********
- **Full Name:** Limited User

Assigned a built-in read-only role such as **viewer**, or a custom role with limited permissions.

Saved the new user configuration.

---

# Step 3: Create a Custom Role (Optional)

Created a custom role using the Elasticsearch Security API.

```http
PUT /_security/role/viewer_role
{
  "cluster": ["monitor"],
  "indices": [
    {
      "names": ["my_index"],
      "privileges": ["read"]
    }
  ]
}
```

This role grants monitoring privileges and read-only access to the specified index.

---

# Step 4: Verify User Permissions

Logged out from the administrator account.

Logged in using the **limited_user** account.

Opened **Discover** in Kibana and attempted to access Elasticsearch indices.

Verified that:

- Assigned indices were accessible.
- Unauthorized indices were restricted.
- Administrative features were unavailable.

---

# Commands Used

```http
PUT /_security/role/viewer_role
{
  "cluster": ["monitor"],
  "indices": [
    {
      "names": ["my_index"],
      "privileges": ["read"]
    }
  ]
}
```

---

# What We Learned

- Created a new Elasticsearch user.
- Assigned built-in and custom roles.
- Applied Role-Based Access Control (RBAC).
- Restricted access to specific indices.
- Verified user permissions through Kibana.
- Improved Elasticsearch security using least-privilege access.

---

# Key Concepts

| Term | Description |
|------|-------------|
| **User** | An account used to authenticate and access Elasticsearch or Kibana. |
| **Role** | A collection of permissions assigned to users. |
| **Privilege** | Defines the actions a user is allowed to perform. |
| **RBAC (Role-Based Access Control)** | Security model that controls access based on assigned roles. |
| **Viewer Role** | Built-in read-only role for viewing data without modification privileges. |

---

# Screenshots

## Screenshot 1

**Creating a Limited User in Kibana**

![](lim-user.png)

---

# Conclusion

This lab introduced the security features of Elasticsearch by demonstrating how to create users, assign roles, and restrict access to indices. Using Role-Based Access Control (RBAC), only authorized users were allowed to access specific data, improving the overall security of the Elastic Stack and protecting sensitive information from unauthorized access.
