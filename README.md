## What is Project Future?

It is basically a object detection web app that allows to translate detected object to other languages using Django Framework, Google Cloud Vision API and Google Translate API.

This is for our(Me([@Gimbir](https://github.com/gimbir)) and [@Venuin](https://github.com/Venuin)) final year project. We decided to call it as "Project Future" because we think this project will contribute to our future professional life in the way of learning new tech and applying them.

***

## How it works?
It is quite simple. Just upload an image and click the translate button and let the Google Cloud Vision do its thing.

**You need a local Apache and MySQL server to run the app. We recommend to use XAMPP.**<br/>

After running Apache and MySQL servers, make sure to create a database named ***'project_future'*** in ***localhost/phpmyadmin*** and after that migrate database in terminal by using <br/>
```
python manage.py makemigrations 
python manage.py migrate
```
commands in the root of project directory.

**_Note_:** ***Don't forget to run `Languages.py` file by using `python Languages.py` command in terminal to insert languages to database.***

or you can use the file named ***'project_future.sql'*** to import the database directly to MySQL but first you still need to create an empty database named ***'project_future'***. You don't need to use migrate commands and also don't need to add languages if you use this way.

In case you have any issue about migration you can check **[this](https://simpleisbetterthancomplex.com/tutorial/2016/07/26/how-to-reset-migrations.html "https://simpleisbetterthancomplex.com/tutorial/2016/07/26/how-to-reset-migrations.html")** page to solve the problem.

###For security reasons we cannot share the API Token. You need Google Cloud Service Account Token to be able to use the application without error. You can check [this](https://www.youtube.com/watch?v=wfyDiLMGqDM "https://www.youtube.com/watch?v=wfyDiLMGqDM") video to learn how to do it or simply Google it.

Finally to run the Django Server, in the root project directory, run `python manage.py runserver` command.


![Image Sample](https://image.prntscr.com/image/EUBMsYoLRmm6gBydU_d90g.png "Image Sample")

![Result Sample](https://image.prntscr.com/image/vN-1pEy7Ti2aGX1TX5fAaA.png "Result Sample")
