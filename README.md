# Pay It Forward

## Running the Application:

Log in to your terminal and clone the repository

'cd' into the PayItForward directory

Run 'bundle install --without production' and then 'bundle update' to get the correct versions of the gems

Enter 'rails db:migrate'

Enter 'rails db:seed'

There may be a slight delay as the seeds file creates dummy data.

Finally run 'rails server --binding=YOUR_IP_ADDRESS' 

Navigate to your server's address at port 3000.

On initial startup, you will have to create an account to access the application. Navigate to the "Sign up now!" to do so.

The admin account's credentials are as follows:
*email: example@ex.org
*password: foobar

## Suggested Systems

This application has been tested using Chrome, Firefox, and Edge web browsers on a Windows 10 computer. It is suggested, however, that Chrome or Firefox be used since Edge sometimes throws errors with common syntax. This application should be used on a laptop or desktop since it is not designed for a mobile phone screen. And the operating system should be recent. 

## Known Limitations/Bugs

Currently, the webapp can perform all functions that it was designed to go. However, there is still little error handling for issues such as routing errors and missing method errors. The only error successfully handled was the missing id error which renders a 404 error page.

## Using This Application

### User List 
Upon login, the user will be directed to the home page with a list of all users on the platform. All users have a profile image, name, and user type. Their type is determined based on which list they utilize. No type will show if their lists are blank.

### User Profiles
Clicking on a user's name will take you to their profile page. This page serves a few different functions inclusing asking them for access to their mailing address, giving them access to your mailing address, messaging them, viewing their microposts, and viewing the items they both need and are donating. 

##### Requesting Access
This button will automatically send a message from you to the user, requesting access. You will be redirected to the conversation between you and that user. 

If you already have access to this user, this button wil be replaced by a gray one asking if you would like to delete your access. Clicking this will delete your access and the other user must give it again if you want to view their address.

##### Giving Access
Clicking this button will allow the user to view your address on their access page.

If the user has access, the option to delete their access will appear. 

##### Messaging

Similar to requesting access, this link takes you to a conversation between you and the user where you can type in a message.

##### User Item Lists

These lists display what the user currently needs and also what they are donating. 

##### Microposts

A list of all user microposts is shown. 

##### Your Profile

Clicking on "Profile" will take you to your own profile where much of the same information is present without the access and messaging buttons. However, on your own profile you can make a new micropost to add to your feed. 

### Your Lists

You can add or edit your lists by going to the "My Lists" tab. Item name, description, and whether you are donating it or not are all the customizable options. 

### Your access

You can view the users names and addresses you have access to.

You can also view who has access to your information and delete it if you wish.

### Inbox

Navigating to the inbox allows you to see the conversations you are currently part of. Clicking on the user's name will take you to that conversation. 

### Settings

In case you wish to change your profile information, you may do so here. 
