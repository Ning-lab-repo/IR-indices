This branch contains models associated with the article titled "Machine learning-based comparisonand optimization of TyG, TvG-BMl, and TG/HDL-c indices for short- and long-term mortality prediction in critically ilstroke patients".


## Models introduction  
For the RSF models mentioned in the article, we saved the "*.pkl" format file of the models in the branch named "Model", including 1 base model and 3 optimized models of IR indices.  

* rsf_base_model.pkl: The dataset was partitioned into training and validation sets in a 7:3 ratio, with the training set utilized for base model development, where 19 basic features were input into a RSF model to predict mortality risk in critically ill stroke patients at various time points. Multiple performance metrics were employed to assess the models in the validation cohort, including AUC, accuracy, sensitivity, specificity, PPV, NPV, F1 score, and MCC.

* rsf_base_plus_TyG_model.pkl: The dataset was partitioned into training and validation sets in a 7:3 ratio, with the training set utilized for model development, where 19 basic features plus the TyG index were input into a RSF model to predict mortality risk in critically ill stroke patients at various time points. Multiple performance metrics were employed to assess the models in the validation cohort, including AUC, accuracy, sensitivity, specificity, PPV, NPV, F1 score, and MCC.

* rsf_base_plus_TyG-BMI_model.pkl：The dataset was partitioned into training and validation sets in a 7:3 ratio, with the training set utilized for model development, where 19 basic features plus the TyG-BMI index were input into a RSF model to predict mortality risk in critically ill stroke patients at various time points. Multiple performance metrics were employed to assess the models in the validation cohort, including AUC, accuracy, sensitivity, specificity, PPV, NPV, F1 score, and MCC.

* rsf_base_plus_HDL-C_model.pkl：The dataset was partitioned into training and validation sets in a 7:3 ratio, with the training set utilized for model development, where 19 basic features plus the TG/HDL-C index were input into a RSF model to predict mortality risk in critically ill stroke patients at various time points. Multiple performance metrics were employed to assess the models in the validation cohort, including AUC, accuracy, sensitivity, specificity, PPV, NPV, F1 score, and MCC.
