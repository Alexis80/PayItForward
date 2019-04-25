# Pay It Foward

In order to run the application:

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

Upon login, the user will be directed to the home page with a list of all users on the platform.

#### User Profiles
Clicking on a user's name will take you to their profile page. This page serves a few different functions inclusing asking them for access to their mailing address, giving them access to your mailing address, messaging them, viewing their microposts, and viewing the items they both need and are donating. 

###### Request Access to this User
This button will automatically send a message from you to the user, requesting access. You will be redirected to the conversation between you and that user. 

If you already have access to this user, this button wil be replaced by a gray one asking if you would like to delete your access. Clicking this will delete your access and the other user must give it again if you want to view their address.

###### Request Access to this User

######

Hovering over "Account" and then clicking on "Profile" will take you to your own profile where much of the same information is present without the access and messaging buttons. However, on your own profile you can make a new micropost to add to your feed. 

