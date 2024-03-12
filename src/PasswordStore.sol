// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // info: is this the correct version ?.

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see.
 * You can update your password at any time.
 */
contract PasswordStore {
    error PasswordStore__NotOwner();

    /**========================================================================
     *                           STATE VARIABLES
     *========================================================================**/
    address private s_owner;
    // alert: the password is stored on chain is not secure. even if it is private, it can be accessed by anyone.
    string private s_password;

    event SetNetPassword();

    constructor() {
        s_owner = msg.sender;
    }

    /**========================================================================
     *                           METHODS
     *========================================================================**/

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
     // alert: there is no checks wether the owner is the one calling the function or not.
    function setPassword(string memory newPassword) external {
        s_password = newPassword;
        emit SetNetPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     * @param newPassword The new password to set.
     */
     // warning: documentation is saying there should be a parameter but there is none. invalid documentation.
    function getPassword() external view returns (string memory) {
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }
        return s_password;
    }
}
