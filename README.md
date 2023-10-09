# Testing git, Docker

Step-by-step guide for setting up git and docker on Mac

First we need to install brew. 

1. Install Homebrew: Copy and paste the following command in the terminal:
 ```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 ```

2. Follow the on-screen instructions: The script will guide you through the installation. You might need to enter your macOS user password to grant the necessary permissions.
3. Verify the Installation: Once the installation is complete, you can verify it by typing:
 ```
brew --version
 ```

4. Install Git: Now that Homebrew is installed, you can use it to install Git with the following command:
 ```
brew install git
 ```

Note: It could be that Homebrew is successfully installed, but its binary location (/opt/homebrew/bin) might not in your shell's PATH. This means you won't be able to run brew commands without specifying the full path, which can be inconvenient. To resolve this and ensure that you can run brew from any terminal window, you'll need to update your PATH. 

Here's what you need to do:

1. Update your .zprofile: You add Homebrew to your PATH by appending specific lines to your .zprofile. You can do this by running the commands provided:
 ```
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/noor/.zprofile
 ```

2. Activate the changes in the current session:
 ```
eval "$(/opt/homebrew/bin/brew shellenv)"
 ```

3. Verify Installation:
 ```
brew --version
 ```

## Setting up git 

Assuming git is installed using 'brew install git'

1. Configuration: After installing, you need to set up your personal information which will be used in your commits.
   a. Set your name:
 ```
 git config --global user.name "Your Name"
 ```
  b. Set your email (the one you used for GitHub):
  ```
  git config --global user.email "youremail@example.com"
  ```

2. Check Installation: After installation, open your terminal and type:
```
git --version
```
This command should return the installed version of Git, confirming that Git was installed correctly.

4. Connect with GitHub:
   a. Generate an SSH key (if you don't have one already) by following GitHub's guide on SSH keys.
   b. Add your SSH key to your GitHub account. Instructions can be found in the same guide mentioned above.
   c. Now, when you clone repositories using SSH, or push/pull to/from them, it will use the SSH key authentication.

## Generate an SSH Key
1. Generate a New SSH Key:
   a. Type the following command, replacing the email with the one you use for GitHub:
   ```
   ssh-keygen -t ed25519 -C "youremail@example.com"
   ```
   b. The -t ed25519 specifies the type of encryption. If you face any compatibility issues, you can also use -t rsa -b 4096 for older encryption.

2. Save the SSH Key:
   a. When prompted to "Enter a file in which to save the key," you can press Enter to save it to the default location, usually ~/.ssh/id_ed25519 for the private key and ~/.ssh/id_ed25519.pub for    the public key.

## Add Your SSH Key to Your GitHub Account
After generating your SSH key pair, you need to give GitHub your public key to establish a secure connection.

1. Copy the Public SSH Key
   a. To display and copy the content of your public key, run:
   ```
   cat ~/.ssh/id_ed25519.pub | pbcopy
   ```

2. Add the Key to GitHub:
   a. Go to GitHub and log into your account.
   b. Click on your profile picture in the top right corner and select Settings.
   c. In the left sidebar, click on SSH and GPG keys.
   d. Click on the New SSH key button.
   e. In the title field, provide a descriptive name (e.g., "My Macbook Pro").
   f. In the key field, paste the copied SSH public key (Cmd + V).
   g. Click Add SSH key to save.

## SSH Key Authentication
With the SSH key pair generated and the public key added to GitHub, whenever you perform Git operations like clone, pull, or push with repositories over SSH, Git will use the SSH key pair for authentication, allowing you to avoid entering your GitHub username and password every time.

### Create local repository
```
cd ~/path/to/your/workspace
mkdir Test
cd Test
git init
```

### Add Some Content
```
echo "# My New Repository" > README.md
git add README.md
git commit -m "Initial commit"
```

### Push to GitHub
Before you can push, you need to create a new repository on GitHub:
1. Go to GitHub.
2. Log in if you're not already logged in.
3. Click on the '+' sign in the upper right corner and select "New repository".
4. Give it a name (e.g., Test).
5. Leave it as "Public" (or choose "Private" if you prefer).
6. Skip the "Initialize this repository with a README" because you already created one locally.
7. Click "Create repository".

Once the repository is created, GitHub will provide a URL for your repository. It'll look something like: 
 
  ```
git@github.com:YourUsername/Test.git
  ```

8. Link Your Local Repository to GitHub:
   ```
   git remote add origin git@github.com:YourUsername/Test.git

   ```
10. Push Your Local Repository to GitHub:
    ```
    git push -u origin master
    ```

## Running docker
1. Create virtual environment 'python -m venv venv' 
2. Activate virtual environment:
  ```
  source /Users/noor/Documents/Test/venv/bin/activate
  ```
3. Create Docker file:
   a. In the same directory as your main.py, create a file named Dockerfile (without any file extension)

4. Build the Docker Image:
   ```
   docker build -t myfastapiimage .
   ```

5. Run the Docker Container
   ```
   docker run -d -p 8000:8000 myfastapiimage
   ```

   In case you see a long string it means our Docker container has been started successfully. To confirm your docker is running:
     a. Use the command docker ps to list the currently running containers. You should see your myfastapiimage in the list.
     b. Open a web browser and navigate to http://localhost:8000. You should see the FastAPI response.

6. Stop docker
   ```
   docker stop 951569ba  ### Assuming string is 951569ba5d2551373eeb8fbb1126ad20708b8236f6cb5823ee45ccb87602f048
   ```

## Push changes to GitHub repository

```
git status
git add .
git commit -m "Your commit message here"
git push origin master ## or git push origin main
```


  
   






