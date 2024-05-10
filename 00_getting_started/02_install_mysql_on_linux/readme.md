#  How to Install MySQL Workbench
1. Open your browser and **download SQL Workbench** for your **Linux** system from here. You will see a screen as shown below then click on the**Download button**.  <ins>Shown in figure(01)</ins>
<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-13-43.png">
<p align="center"><em>figure(01)</em></p>
<hr>
2.  After clicking on download you will get a confirmation screen, click on <b>No thanks</b>, just start my download on the left side of your screen. <ins>Shown in figure(02)</ins>
<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-14-42.png">
<p align="center"><em>figure(02)</em></p>
<hr>
3. Open your terminal and navigate to that folder in which you have downloaded that workbench file using <b>cd</b> FolderName.Then type <b>ls</b> command that list all files and folders in current directory. <ins>Shown in figure(03)</ins><br>

```zsh
cd <folder name>

ls
```
<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-17-19.png">

<p align="center"><em>figure(03)</em></p>
<hr>
4. Run <b>installation</b> command.After navigating to that folder, run the following command in your terminal to install MySQL Workbench. <ins>Shown in figure(04)</ins>

```zsh
sudo apt-get install ./fileNameOfInstallationPackage
```
<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-18-27.png">
<p align="center"><em>figure(04)</em></p>
<hr>

5. After running the above command you will get a prompt screen. Choose <b>Debian buster</b> using your keyboard arrow buttons and press enter. <ins>Shown in figure(05)</ins>

<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2001-32-22.png">
<p align="center"><em>figure(05)</em></p>
<hr>

6. After that <b>choose ok</b> and press <b>enter</b>. <ins>Shown in figure(06)</ins>

<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-28-45.png">

<hr>

7. On your terminal <b>update</b> your packages using the following command. <ins>Shown in figure(07)</ins>
```zsh
sudo apt-get update
```
<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-32-13.png">

<p align="center"><em>figure(07)</em></p>

<hr>

8. Start <b>snapd</b> using the command below.Install <b>SQL workbench community</b>. Now, we have to install MySQL Workbench Community. For this, I have used <b>snap</b>. You can also install this using the  command bellow. <ins>Shown in figure(08)</ins>
```zsh
sudo apt insatll snapd
sudo systemctl start snapd
snap install mysql-workbench-community
```

<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-43-01.png">

<p align="center"><em>figure(08)</em></p>
<hr>
9. That’s it, Now SQL Workbench is now installed on your Linux system. To verify You can <b>search MySQL Workbench</b> on your app drawer. <ins>Shown in figure(09)</ins>

<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2000-56-47.png">

<p align="center"><em>figure(09)</em></p>

<hr>

# Congratulations! Installation of MySQL Workbench has been completed successfully:

10. To run <b>click</b> on the <b>icon</b> of <b>MySQL Workbench</b>. <ins>Shown in figure(10)</ins>

<img src="https://github.com/cyber-fanatic/ultimate-mysql-bootcamp/blob/main/00_getting_started/02_install_mysql_on_linux/images/Screenshot%20from%202024-05-09%2019-33-29.png">

<p align="center"><em>figure(10)</em></p>
<hr>

