# Use the base scipy-notebook, you can change this to any Jupyter compatible notebook base
FROM jupyter/scipy-notebook 

# Copy the requirements.txt for any extra libs you want to install
COPY requirements.txt requirements.txt

# Install new pip requirements
RUN pip install -r requirements.txt

# Run any bash setup instructions
COPY setup.sh setup.sh

RUN sh setup.sh