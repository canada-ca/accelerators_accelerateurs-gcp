## Protect root / global admins account(s) with Multi-Factor Authentication

### Enforce uniform MFA to company-owned resources [MFA][]

Protect your user accounts and data with a wide variety of MFA verification methods.  If Cloud Identity is your identity provider (IdP), you can implement 2SV in several ways. If you use a third-party IdP, check with them about their 2SV offering.

When you enforce 2-Step Verification, the enforcement method defaults to “Any.” Consider using security keys, which are the most secure 2-Step Verification method. Learn more about Best practices for 2-Step Verification here <a href="https://support.google.com/a/answer/175197#bestpractices&zippy=%2Cenforce--step-verification-for-administrators-and-key-users%2Cconsider-using-security-keys-in-your-business">Best Pratices<a/>

###Enforcement methods<br>
Any—Users can set up any 2-Step Verification method.
Any except verification codes via text, phone call—Users can set up any 2-Step Verification method except using their phones to receive 2-Step Verification verification codes. Only security key—Users must set up a security key. 

###Steps<br>
Follow the steps defined here under enforce <a href="https://support.google.com/a/answer/9176657?hl=en#zippy=%2Ctell-your-users-to-enroll-in--step-verification%2Cturn-on-enforcement">2-Step Verification<a/>


### **Validation**
As your organization's administrator, you can monitor your users' exposure to data compromise by opening a security report. The security report gives you a comprehensive view of how people share and access data and whether they take appropriate security precautions. You can also see who installs external apps, shares a lot of files, skips 2-Step Verification, uses security keys, and more.


[MFA]: https://cloud.google.com/identity/solutions/enforce-mfa
