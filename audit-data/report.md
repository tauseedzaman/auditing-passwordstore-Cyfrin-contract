### [H-1] Password Stored as private does not mean its really private. onchain data is be sean by every one

**Description:** in `PasswordStore.sol` you have used this `string private s_password;` and the goal is to only allow owner to see/get/change password but here every one can read it on the blackchain.

**Impact:** every one can read the password.

**Recommended Mitigation:** this hole idea of storing passwords on the blackchain is invalid... you should either store in a local database or something like that

### [H-2] `setPassword()` there is no checks wether the owner is the one calling the function or not.

**Description:** sence there is no validation for owner in this method any one can call this and change/set someone else password

**Impact:** destroys the hole idea of this contract that only owners can set and get there password.  

**Recommended Mitigation:** add validation just like `getPassword()` method


### [I-1] In `getPassword()` its documented that its `newPassword` as a argument but there is no code like that. 

**Description:** its like misinformation either add that feature to this method or update the documentation for that method.

**Recommended Mitigation:** update the documentation or method code
