FROM tensorflow/serving:latest

<<<<<<< HEAD
COPY ./output/serving_model/models/cc-model
COPY ./config /model_config
=======
COPY ./output/serving_model /models/review-model
>>>>>>> f745380abe23a0d48fcb3e2531564867a56824ca

ENV MODEL_NAME=review-model


RUN echo '#!/bin/bash \n\n\
env \n\
tensorflow_model_server --port=8500 --rest_api_port=${PORT} \
--model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
"$@"' > /usr/bin/tf_serving_entrypoint.sh \
&& chmod +x /usr/bin/tf_serving_entrypoint.sh  
