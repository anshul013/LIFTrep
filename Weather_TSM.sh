if [ ! -d "./prefetch" ]; then
    mkdir -p ./prefetch
fi

if [ ! -d "./results" ]; then
    mkdir -p ./results
fi

if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Lead" ]; then
    mkdir ./logs/Lead
fi

# First run the backbone TSMixer
sh scripts/backbone/TSMixer/weather.sh

itr=1
seq_len=336
tag=_max
tau=1.0
data=weather
model_name=TSMixer
num_channels=21

# For prediction length 96
pred_len=96
leader_num=2
state_num=12
learning_rate=0.0001
checkpoint_path="./checkpoints/${model_name}_${data}_${pred_len}"

python -u run_longExp.py \
    --activation 'relu' \
    --dropout 0.3 \
    --hidden_size 32 \
    --num_blocks 4 \
    --dataset $data \
    --model $model_name \
    --model_id "${data}_${seq_len}_${pred_len}" \
    --lift \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in $num_channels \
    --itr $itr \
    --checkpoints $checkpoint_path \
    --leader_num $leader_num \
    --state_num $state_num \
    --temperature $tau \
    --pretrain \
    --freeze \
    --des 'Exp' \
    --learning_rate $learning_rate \
    > logs/Lead/$model_name'_pretrain_'$data'_'$pred_len'_K'$leader_num'_tau'$tau'_state'$state_num'_lr'$learning_rate.log 2>&1

# For prediction length and 192
pred_len=192
leader_num=2
state_num=16
learning_rate=0.0001
checkpoint_path="./checkpoints/${model_name}_${data}_${pred_len}"
    
python -u run_longExp.py \
    --activation 'relu' \
    --dropout 0.3 \
    --hidden_size 8 \
    --num_blocks 6 \
    --dataset $data \
    --model $model_name \
    --model_id "${data}_${seq_len}_${pred_len}" \
    --lift \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in $num_channels \
    --itr $itr \
    --checkpoints $checkpoint_path \
    --leader_num $leader_num \
    --state_num $state_num \
    --temperature $tau \
    --pretrain \
    --freeze \
    --des 'Exp' \
    --learning_rate $learning_rate \
    > logs/Lead/$model_name'_pretrain_'$data'_'$pred_len'_K'$leader_num'_tau'$tau'_state'$state_num'_lr'$learning_rate.log 2>&1

# For prediction length 336
pred_len=336
leader_num=4
state_num=16
learning_rate=0.0001
checkpoint_path="./checkpoints/${model_name}_${data}_${pred_len}"

python -u run_longExp.py \
    --activation 'relu' \
    --dropout 0.7 \
    --hidden_size 8 \
    --num_blocks 4 \
    --dataset $data \
    --model $model_name \
    --model_id "${data}_${seq_len}_${pred_len}" \
    --lift \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in $num_channels \
    --itr $itr \
    --checkpoints $checkpoint_path \
    --leader_num $leader_num \
    --state_num $state_num \
    --temperature $tau \
    --pretrain \
    --freeze \
    --des 'Exp' \
    --learning_rate $learning_rate \
    > logs/Lead/$model_name'_pretrain_'$data'_'$pred_len'_K'$leader_num'_tau'$tau'_state'$state_num'_lr'$learning_rate.log 2>&1

# For prediction length 720
pred_len=720
leader_num=2
state_num=8
learning_rate=0.0001
checkpoint_path="./checkpoints/${model_name}_${data}_${pred_len}"

python -u run_longExp.py \
    --activation 'relu' \
    --dropout 0.7 \
    --hidden_size 64 \
    --num_blocks 4 \
    --dataset $data \
    --model $model_name \
    --model_id "${data}_${seq_len}_${pred_len}" \
    --lift \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in $num_channels \
    --itr $itr \
    --checkpoints $checkpoint_path \
    --leader_num $leader_num \
    --state_num $state_num \
    --temperature $tau \
    --pretrain \
    --freeze \
    --des 'Exp' \
    --learning_rate $learning_rate \
    > logs/Lead/$model_name'_pretrain_'$data'_'$pred_len'_K'$leader_num'_tau'$tau'_state'$state_num'_lr'$learning_rate.log 2>&1