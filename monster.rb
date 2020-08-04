require "./character"

class Monster < Character
  
    POWER_UP_RATE = 1.5
    # HPの半分の値を計算する定数
    CALC_HALF_HP = 0.5

    def initialize(**params)
        super(
            name: params[:name],
            hp: params[:hp],
            offense: params[:offense],
            defense: params[:defense]
        )

        # 親要素で定義していない処理はそのまま残す
        @transform_flag = false

        # 定数を使用
        @trigger_of_transform = params[:hp] * CALC_HALF_HP
    end

    def attack(brave)
        if @hp <= @trigger_of_transform && @transform_flag == false
            @transform_flag = true
            transform
        end

        # puts "#{@name}の攻撃"
        attack_message
        # ダメージ計算処理の呼び出し
        damage = calculate_damage(brave) 
        cause_damage(target: brave, damage: damage)
        # puts "#{brave.name}の残りHPは#{brave.hp}だ"
        damage_message(target: brave, damage: damage)
    end


private

    def calculate_damage(target)
        damage = @offense - target.defense
    end

    def cause_damage(**params)
        target = params[:target]
        damage = params[:damage]
        target.hp -= damage
        target.hp = 0 if target.hp <0
        # puts "#{target.name}は#{damage}のダメージを受けた"
       
    end



    def transform
        transform_name = "大魔王"

        transform_message(origin_name: @name, transform_name: transform_name)
        
        

        @offense *= POWER_UP_RATE
        @name = transform_name
    end

end

