module MessageDialog

    # 攻撃時のメッセージ
    def attack_message(**params)
        attack_type = params[:attack_type]
        # 攻撃実行側のクラスのnameのパラメータを使用して攻撃メッセージを表示
        puts "-------------------------------"
        puts "#{name}の攻撃"
        puts "必殺攻撃" if attack_type == "special_attack"
        
        
    end

    # ダメージを受けた時のメッセージ
    def damage_message(**params)
        target = params[:target]
        damage = params[:damage]

        puts <<~EOS
        #{target.name}は#{damage}のダメージを受けた
        #{target.name}の残りHPは#{target.hp}だ
        EOS

    end

    # バトルが終了した時のメッセージ
    def end_message(result)
        if result[:brave_win_flag]
            puts <<~EOS
            -------------------------------
            #{@brave.name}は思いもよらず勝ってしまった
            "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
            -------------------------------
            EOS
        else
            puts <<~EOS
            -------------------------------
            #{@brave.name}は戦いに負けた
            目の前が真っ暗になった
            -------------------------------
            EOS
        end
    end

    def transform_message(**params)
        origin_name = params[:origin_name]
        transform_name = params[:transform_name]

        puts <<~text
        "#{origin_name}は怒っている"
        "#{origin_name}は#{transform_name}に変身した"
        text


    end

end