for BASEMODEL in "gpt-4o" "gpt-3.5-turbo" "Qwen2-7B" "Llama-3-8B" "Mistral-7B" "Deepseek-7b" 
do
    for DATASET in "xsum"
    do
    python spo/run_spo.py \
        --eval_only \
        --from_pretrained=./ckpt/ai_detection_polish_500_spo_lr_0.0001_beta_0.05_a_1 \
        --cache_dir=./models \
        --output_file=./results/main/expand/${BASEMODEL} \
        --eval_dataset="data/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL}.raw_data.json"
    done
done

