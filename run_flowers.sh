model_root=params
exp_name=$1
project=$2
data_path=$2
port=$3
output_dir=results
seed=42
data_name=""
num_class=0
model_type="vit"
use_deep="False"


# if [ $re == "re" ]
# then 
#   re="-re"
# else
#   re=""
# fi

if [ $use_deep == "yes" ]
then 
  use_deep="True"
else
  use_deep="False"
fi

if [ $data_path = "cub" ]
then
  data_path=./data/CUB_200_2011
  data_name="CUB"
  num_class=200
elif [ $data_path = "in100" ]
then
  data_path=~/codes/VPT-SSL/data/ImageNet_100
  data_name="IN100"
  num_class=100
  NO_TEST="True"
elif [ $data_path = "dogs" ] 
then
  data_path=~/codes/VPT-SSL/data/Dogs
  data_name="StanfordDogs"
  num_class=120
elif [ $data_path = "cars" ] 
then
  data_path=~/codes/VPT-SSL/data/Cars
  data_name="StanfordCars"
  num_class=196
elif [ $data_path = "nabirds" ] 
then
  data_path=~/codes/VPT-SSL/data/nabirds
  data_name="nabirds"
  num_class=555
elif [ $data_path = "flowers" ] 
then
  data_path=./data/Flowers
  data_name="OxfordFlowers"
  num_class=102
fi


echo $data_path
echo $data_name
echo $project
echo $model_type

# export CUDA_VISIBLE_DEVICES="0"

encoder='sup_vitb16'
crop_size=112
flash_attn="False"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=112
flash_attn="True"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=112
flash_attn="False"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=112
flash_attn="True"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"


encoder='sup_vitb16'
crop_size=224
flash_attn="False"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=224
flash_attn="True"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=224
flash_attn="False"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=224
flash_attn="True"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=336
flash_attn="False"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=336
flash_attn="True"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=336
flash_attn="False"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitb16'
crop_size=336
flash_attn="True"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=112
flash_attn="False"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=112
flash_attn="True"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=112
flash_attn="False"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=112
flash_attn="True"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"


encoder='sup_vitl16'
crop_size=224
flash_attn="False"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=224
flash_attn="True"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=224
flash_attn="False"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=224
flash_attn="True"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=336
flash_attn="False"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=336
flash_attn="True"
grad_ckpt="False"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=336
flash_attn="False"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

encoder='sup_vitl16'
crop_size=336
flash_attn="True"
grad_ckpt="True"
python3 train.py \
        --port "${port}" \
        --exp-name "${encoder}_${crop_size}_fa_${flash_attn}_gc_${grad_ckpt}" \
        --project "vpt-aisystem" \
        --config-file configs/prompt/cub.yaml \
        --wandb \
        DATA.BATCH_SIZE "64" \
        DATA.CROPSIZE "${crop_size}" \
        MODEL.PROMPT.NUM_TOKENS "100" \
        SOLVER.WEIGHT_DECAY "0.0" \
        SOLVER.BASE_LR "0.5" \
        MODEL.PROMPT.DROPOUT "0.1" \
        SEED ${seed} \
        MODEL.TYPE "${model_type}" \
        MODEL.PROMPT.DEEP "${use_deep}" \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        DATA.NAME "${data_name}" \
        DATA.FEATURE "${encoder}" \
        DATA.NUMBER_CLASSES "${num_class}" \
        MODEL.TRANSFER_TYPE "prompt" \
        MODEL.PROMPT.INITIATION "random" \
        MODEL.PROMPT.VIT_POOL_TYPE "original" \
        MODEL.PROMPT.FLASH_ATTN "False" \
        MODEL.PROMPT.FLASH_ATTN_TORCH20 "${flash_attn}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" \
        MODEL.PROMPT.GRAD_CKPT "${grad_ckpt}" \
        MODEL.PROMPT.GRAD_CKPT_NUM_SEG "1"

