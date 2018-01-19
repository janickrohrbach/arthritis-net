# Arthritis Net
Automated bone erosion scoring for rheumatoid arthritis with deep convolutional neural networks

## About
In fall 2017 I wrote a project thesis at the Zurich University of Applied Sciences, where I examined whether bone erosion scores of patients with rheumatoid arthritis can be predicted wih deep convolutional neural networks. The networks were trained on cropped x-ray images of left hands. The code in this repository was used to obtain the results in the thesis.

The thesis can be found here: [/doc/project.pdf](../master/doc/project.pdf)

All jupyter notebooks can be run on the following docker container: [tensorflow:1.4.0-gpu-py3](https://gcr.io/tensorflow/tensorflow:1.4.0-gpu-py3)

## Files
Below is a list of the files in the master branch of this repository with a description of what they are used for. There is also the model_selection branch which contains the other models which were not selected.

| Filepath                                                    | Description   |
| ----------------------------------------------------------- | ------------- |
| [/correlation_analysis/correlation_analysis.ipynb](../master/correlation_analysis/correlation_analysis.ipynb)     | Jupyter Notebook that shows correlations between the Rau-score and the DAS-score |
| [/correlation_analysis/plots_for_thesis.Rmd](../master/correlation_analysis/plots_for_thesis.Rmd)     | R-Markdown file used to create the correlation plots for the thesis |
| [/doc/img/](../master/doc/img/)     | This folder contains all images used in the thesis |
| [/doc/project.pdf](../master/doc/project.pdf)     | The thesis |
| [/doc/project.tex](../master/doc/project.tex)     | The LaTex file for the thesis|
| [/doc/project.tex](../master/doc/project.tex)     | The BibTex file with the references of the thesis|
| [/tensorboard/](../master/tensorboard/)     | This folder contains all the tensorboard logs from the training of the models|
| [/tsne/tsne_regression.R](../master/tsne/tsne_regression.R)     | This R-script contains an analysis of the outliers in the T-SNE|
| [attention_map_classification.ipynb](../master/attention_map_classification.ipynb)     | Jupyter notebook that shows the attention map of the classification model|
| [attention_map_regression.ipynb](../master/attention_map_classification.ipynb)     | Jupyter notebook that shows the attention map of the regression model|
| [deepxray_classification_weights.ipynb](../master/deepxray_classification_weights.ipynb)     | Jupyter notebook used for the training of the classification model with weighted loss function|
| [deepxray_classification_weights_transfer_learning.ipynb](../master/deepxray_classification_weights_transfer_learning.ipynb)     | Jupyter notebook used for the training of the transfer learning classification model with weighted loss function|
| [deepxray_regression_original.ipynb](../master/deepxray_regression_original.ipynb)     | Jupyter notebook used for the training of the regression model on original data|
| [deepxray_regression_original_transfer_learning.ipynb](../master/deepxray_regression_original_transfer_learning.ipynb)     | Jupyter notebook used for the training of the transfer learning regression model on original data|
| [embeddings_classification.ipynb](../master/embeddings_classification.ipynb)     | Jupyter notebook with T-SNE of the embeddings of the classification model|
| [embeddings_classification_transfer_learning.ipynb](../master/embeddings_classification_transfer_learning.ipynb)     | Jupyter notebook with T-SNE of the embeddings of the transfer learning classification model|
| [embeddings_regression.ipynb](../master/embeddings_regression.ipynb)     | Jupyter notebook with T-SNE of the embeddings of the regression model|
| [embeddings_regression_transfer_learning.ipynb](../master/embeddings_regression_transfer_learning.ipynb)     | Jupyter notebook with T-SNE of the embeddings of the transfer learning regression model|
| [prediction_time.ipynb](../master/prediction_time.ipynb)     | Jupyter notebook that loads the two models and creates predictions. Measures the execution time for both predictions.|
| [preprocessing.ipynb](../master/preprocessing.ipynb)     | Jupyter notebook that preprocesses the data (train, test & validation set of images and labels) for the classification model|
| [preprocessing_regression.ipynb](../master/preprocessing.ipynb)     | Jupyter notebook that preprocesses the data (train, test & validation set of images and labels) for the regression model|
| [validate_classification.ipynb](../master/validate_classification.ipynb)     | Jupyter notebook with predictions of the classification model for the test set|
| [validate_regression.ipynb](../master/validate_regression.ipynb)     | Jupyter notebook with predictions of the regression model for the test set|


 
