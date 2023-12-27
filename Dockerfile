#----------------------Single-stage build, uncomment '#' to use---------------------

#FROM python:3.11-alpine
#WORKDIR /app

##Create Virtual environment PATH
#ENV PATH="/app/my-env/bin:$PATH"

##Create the virtual environment
#RUN python -m venv /app/my-env

#RUN pip install Flask
#COPY . /app
#EXPOSE 80

##Set a default entrypoint
#ENTRYPOINT ["/app/my-env/bin/python3"]

#CMD ["-u", "calculator.py"]


#-----------------------multi-stage build, uncomment '#' to use---------------------

##Stage1-build
FROM python:3.11-alpine AS Build
WORKDIR /app

##Create Virtual environment PATH
ENV PATH="/app/my-env/bin:$PATH"

##Create the virtual environment
RUN python -m venv /app/my-env

##Install dependencies
RUN pip install Flask
COPY . /app

##Stage2-Runtime
FROM python:3.11-alpine AS Run
WORKDIR /app

##Copy from the build stage
COPY --from=Build /app /app

##Expose port 80
EXPOSE 80

##Set a default entrypoint
ENTRYPOINT ["/app/my-env/bin/python3"]

##Run the App
CMD ["-u","calculator.py"]
