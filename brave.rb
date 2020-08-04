require "./character"

class Brave < Character
    
    
    SPECIAL_ATTACK_CONSTANT = 1.5

    # 引数でモンスタークラスのインスタンスを受け取る
    def attack(monster)

        

        # decision_attack_typeメソッドの呼び出し この箇所の理解がまだ不十分です
        attack_type = decision_attack_type
        damage = calculate_damage(target: monster, attack_type: attack_type)
        cause_damage(target: monster, damage: damage)

        # puts "#{@name}の攻撃"
        attack_message(attack_type: attack_type)

        # puts "#{@name}の残りHPは#{monster.hp}だ"
        damage_message(target: monster, damage: damage)

    end
private
    def decision_attack_type
        attack_num = rand(4)

        if attack_num == 0
            # puts "必殺攻撃"   
            "special_attack"
        else 
            # puts "通常攻撃"
            "normal_attack"
        end
    end

    def calculate_damage(**params)
        @target = params[:target]
        @attack_type = params[:attack_type]

        if @attack_type == "special_attack"
            calculate_special_attack - @target.defense
        else
            @offense - @target.defense
        end
    end

    def cause_damage(**params)
        @target = params[:target]
        @damage = params[:damage]
        @target.hp -= @damage

        @target.hp = 0 if @target.hp <0
        
        # puts "#{@target.name}は#{@damage}のダメージを受けた"
    end

    def calculate_special_attack
        @offense * SPECIAL_ATTACK_CONSTANT
    end
end

