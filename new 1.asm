.data
moisture:               .word 0
winterplanting:         .word 0
summerplanting:         .word 0
maize:                  .word 0
sorghum:                .word 0
watermelon:             .word 0
groundnuts:             .word 0
potatoes:               .word 0
beans:                  .word 0
peas:                   .word 0
wheat:                  .word 0
pumpkin:                .word 0
maize_fertility:        .word 0
sorghum_fertility:      .word 0
watermelon_fertility:   .word 0
groundnuts_fertility:   .word 0
potatoes_fertility:     .word 0
beans_fertility:        .word 0
peas_fertility:         .word 0
wheat_fertility:        .word 0
pumpkin_fertility:      .word 0
choose:     .space 1 
months_prompt: .asciiz "1.January \n2.February\n3.March ...\n12.December\n enter the month you are currently in:"
invalid_month_msg: .asciiz "Invalid month. Please try again."
prompt:                 .asciiz "WAS THERE ANY RAIN DURING THE MONTH [Y/N] : "
newline:                .asciiz "\n"
separator:              .asciiz "____________________________"
continue_prompt:        .asciiz "\nDo you wish to continue? [Y/N] : "
welcome_msg:            .asciiz "\n\n\n==========================================================================Welcome to Machobane Farming System==============================================================="
winter_harvest_msg: .asciiz "______________________________________________ITS WINTER HARVESTING SEASON _________________________________________\n\n\n"
no_harvest_msg:     .asciiz "\n\n\n_________________________________________________________________________________________________________________________________________\n                                    there was no planting last winter so no crops to harvest                                             \n_________________________________________________________________________________________________________________________________________\n\n\n"
done_harvest_msg:   .asciiz " ##Done harvesting for winter##  ##Done harvesting for winter##  ##Done harvesting for winter##  ##Done harvesting for winter##  ##Done harvesting for winter## \n"
goodbye_msg: .asciiz "######################## Thank you for using our program :) #################################################"
about_msg:   .asciiz "About Machobane Farming System:\n\nThe Machobane Farming System is a simple, low-input technique based on intercropping and localized application of organic manures. Since its re-introduction in the early 1990s, nearly five thousand farmers have integrated this system into their land management, increasing land productivity three-fold compared to traditional monocropping.\n\nThis program offers the following services:\n\n-------------------------------------------\n\t\t1. Soil Preparation\n\t\t2. Planting\n\t\t3. Crop management\n\t\t4. Harvesting\n---------------------------------------------\n\n"
continue_msg: .asciiz "Do you wish to continue? [Y/N] :"
msg_nothing_to_do: .asciiz "\n\n\n_________________________________________________________________________________________________________________________________________\n                                    there is nothing to do during this time                                                                    \n_______________________________________________________________________________________________________________________________________________n\n\n"
msg_continue_terminate: .asciiz "please enter T to terminate program or C to continue\nenter selection ::"
msg_winter_planting_season: .asciiz "____________________________ITS WINTER PLANTING SEASON_____________________________\n\n\n"
msg_continue_or_plant: .asciiz "do you wish to continue to the next month [y] or continue planting [n] :"
msg_available_crops: .asciiz "In the Winter planting season these are the available crops:\n\n\n\t\t1. Wheat    (÷)\n\t\t2. Peas     (*)\n\t\t3. Potatoes (@)\n\n\nSelect the crops you would like to grow :"
msg_select_crops: .asciiz ""
msg_invalid_selection: .asciiz "invalid selection\n"
msg_summer_planting_season: .asciiz "____________________________ITS SUMMER PLANTING SEASON _________________________________________\n\n\n\n"
msg_available_crops_summer: .asciiz "In the Summer planting season these are the available crops:\n\n\n\t\t1. Maize ($)      \n\t\t2. Beans (%)      \n\t\t3. Pumpkin (+)    \n\t\t4. Sorghum (=)    \n\t\t5. Watermelon (&) \n\t\t6. Groundnuts (#) \n\nSelect the crops you would like to grow"
msg_plot_after_sowing: .asciiz "Here is your plot after sowing seeds: \n\n"
done_winter_harvesting: .asciiz "Done harvesting for winter\n"
no_winter_planting: .asciiz "No planting last winter\n"
winter_harvest_info: .asciiz "Winter Harvesting Season\n"
wheat_info:         .asciiz "Wheat seeds planted\n"
peas_info:          .asciiz "Peas seeds planted\n"
potatoes_info:      .asciiz "Potatoes seeds planted\n"
moisture_prompt: .asciiz "WAS THERE ANY RAIN DURING THE MONTH [Y/N] :"
summer_harvesting_msg: .asciiz "_________________________________________ITS SUMMER HARVESTING SEASON _________________________________________\n\n\n"
yield_msg: .asciiz "the yeild is ::\n"
no_planting_msg: .asciiz "\n\n\n_________________________________________________________________________________________________________________________________________\n                                    there was no planting last summer so no crops to harvest                                             \n_________________________________________________________________________________________________________________________________________\n\n\n"
crop_names: .asciiz "maize\tsorghum\twatermelon\tgroundnuts\tbeans\n"
yield_is_msg: .asciiz " seeds planted and  harvest is "

ans_buffer: .space 2
input_buffer: .space 1
.text
main:
        # Call the welcome_menu function
        jal welcome_menu

        # Exit program
        li $v0, 10
        syscall

# Welcome menu function
welcome_menu:
        # Print the welcome message
        li $v0, 4
        la $a0, welcome_msg
        syscall

        # Print the about message
        li $v0, 4
        la $a0, about_msg
        syscall

        # Ask the user if they want to continue
        li $v0, 4
        la $a0, continue_msg
        syscall

        # Read user input
        li $v0, 8
        la $a0, ans_buffer
        li $a1, 2
        syscall

        # Check user's choice
        lb $t0, ans_buffer
        beq $t0, 89, continue_program  # 'Y' or 'y'
        beq $t0, 121, continue_program  # 'Y' or 'y'

        # If 'N' or 'n', print goodbye message and exit
        li $v0, 4
        la $a0, goodbye_msg
        syscall

        # Exit program
        li $v0, 10
        syscall

continue_program:
    # Call the months function
    jal months

    # Call the control function
    jal control

    # Return from welcome_menu
    jr $ra

# months function
months:
    li $v0, 4
    la $a0, months_prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # Store the user input in $t0

    # Check if the month is valid
    blt $t0, 1, invalid_month
    bgt $t0, 12, invalid_month

    j end_months

invalid_month:
    # Print invalid month message
    li $v0, 4
    la $a0, invalid_month_msg
    syscall

    # Repeat the months function
    j months

end_months:
    # Return from the months function
    jr $ra

# control function
control:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $s0, 0($sp)

    # Initialize count
    move $s0, $a0

control_loop:
    # Compare count with 3
    bgt $s0, 3, check_count_5

    # Call winter_harvesting_season
    jal winter_harvesting_season
    b control_terminate

check_count_5:
    # Compare count with 5
    bgt $s0, 5, check_count_7

    # Call winter_planting_season
    jal winter_planting_season
    b control_continue

check_count_7:
    # Compare count with 7
    bgt $s0, 7, check_count_9

    # Display message for count <= 7
    li $v0, 4
    la $a0, msg_nothing_to_do
    syscall

    # Call moisture_track
    jal moisture_track
    b control_continue

check_count_9:
    # Compare count with 9
    bgt $s0, 9, check_count_12

    # Call summer_planting_season
    jal summer_planting_season
    b control_continue

check_count_12:
    # Compare count with 12
    bgt $s0, 12, control_reset_count

    # Call summer_harvesting_season
    jal summer_harvesting_season
    b control_continue

control_reset_count:
    # Reset count to 1
    li $s0, 1
    b control_continue

control_continue:
    # Display message and get user input
    li $v0, 4
    la $a0, msg_continue_terminate
    syscall
    li $v0, 8
    la $a0, input_buffer
    li $a1, 2
    syscall

    # Check user input
    lb $t0, input_buffer
    beq $t0, 84, control_terminate  # 'T' or 't'
    beq $t0, 116, control_terminate  # 'T' or 't'

    beq $t0, 67, control_increment  # 'C' or 'c'
    beq $t0, 99, control_increment  # 'C' or 'c'

    # Invalid input, repeat the loop
    j control_loop

control_increment:
    # Increment count and repeat the loop
    addi $s0, $s0, 1
    j control_loop

control_terminate:
    # Function epilogue
    lw $ra, 4($sp)
    lw $s0, 0($sp)
    addi $sp, $sp, 8

    # Return from control
    jr $ra

winter_planting_season:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $s0, 4($sp)
    sw $s1, 0($sp)

    # Display message
    li $v0, 4
    la $a0, msg_winter_planting_season
    syscall

    # Prompt for user input
    li $v0, 4
    la $a0, msg_continue_or_plant
    syscall
    li $v0, 8
    la $a0, input_buffer
    li $a1, 1
    syscall

    # Check user input
    lb $t0, input_buffer
    beq $t0, 110, winter_planting_continue  # 'n' or 'N'

    # Call soil_preparation and save the result in $s0
    jal soil_preparation
    move $s0, $v0

    # Prompt for crop selection
    li $v0, 4
    la $a0, msg_available_crops
    syscall
    li $v0, 4
    la $a0, msg_select_crops
    syscall
    li $v0, 5
    syscall
    move $s1, $v0
    move $a0, $s1
    move $a1, $s0
    jal crop_for_winter

    # Display plot based on the selected crop
    li $v0, 4
    la $a0, msg_plot_after_sowing
    syscall
    la $a0, ($s1)
    li $v0, 11
    syscall

    # Set winterplanting to true
    li $v0, 1
    sb $v0, winterplanting
    winter_planting_season_exit:
    lw $ra, 8($sp)
    lw $s0, 4($sp)
    lw $s1, 0($sp)
    addi $sp, $sp, 12

    # Return from winter_planting_season
    jr $ra

winter_planting_continue:
    # Call moisture_track and repeat the function
    jal moisture_track
    j winter_planting_season_exit

# crop_for_winter function
crop_for_winter:
    addi $sp, $sp, -8
    sw $ra, 4($sp)

    # Get crop number and method from arguments
    move $t0, $a0  # crop number
    move $t1, $a1  # method

    # Initialize seeds to 15
    li $t2, 15

    # Switch statement for crop selection
    beq $t0, 1, wheat_selected
    beq $t0, 2, peas_selected
    beq $t0, 3, potatoes_selected
    default_case:
        li $v0, 4
        la $a0, msg_invalid_selection
        syscall
        j crop_for_winter_exit

    wheat_selected:
        add $s0, $s0, $t2  # Add seeds to wheat
        beq $t1, 1, set_wheat_fertility
        j crop_for_winter_exit

    peas_selected:
        add $s1, $s1, $t2  # Add seeds to peas
        beq $t1, 1, set_peas_fertility
        j crop_for_winter_exit

    potatoes_selected:
        add $s2, $s2, $t2  # Add seeds to potatoes
        beq $t1, 1, set_potatoes_fertility
        j crop_for_winter_exit

    set_wheat_fertility:
        # Set wheat_fertility to true
        li $v0, 1
        sb $v0, wheat_fertility
        j crop_for_winter_exit

    set_peas_fertility:
        # Set peas_fertility to true
        li $v0, 1
        sb $v0, peas_fertility
        j crop_for_winter_exit

    set_potatoes_fertility:
        # Set potatoes_fertility to true
        li $v0, 1
        sb $v0, potatoes_fertility

crop_for_winter_exit:
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    # Return from crop_for_winter
    jr $ra

summer_planting_season:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $s0, 4($sp)
    sw $s1, 0($sp)

    # Display message
    li $v0, 4
    la $a0, msg_summer_planting_season
    syscall

    # Prompt for user input
    li $v0, 4
    la $a0, msg_continue_or_plant
    syscall
    li $v0, 8
    la $a0, input_buffer
    li $a1, 1
    syscall

    # Check user input
    lb $t0, input_buffer
    beq $t0, 110, summer_planting_continue  # 'n' or 'N'

    # Call soil_preparation and save the result in $s0
    jal soil_preparation
    move $s0, $v0

    # Prompt for crop selection
    li $v0, 4
    la $a0, msg_available_crops_summer
    syscall
    li $v0, 4
    la $a0, msg_select_crops
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    # Call crop_for_summer and save the result in $s1
    move $a0, $s1
    move $a1, $s0
    jal crop_for_summer

    # Display plot based on the selected crop
    li $v0, 4
    la $a0, msg_plot_after_sowing
    syscall
    la $a0, ($s1)
    li $v0, 11
    syscall

    # Set summerplanting to true
    li $v0, 1
    sb $v0, summerplanting
    summer_planting_season_exit:
    lw $ra, 8($sp)
    lw $s0, 4($sp)
    lw $s1, 0($sp)
    addi $sp, $sp, 12

    # Return from summer_planting_season
    jr $ra

summer_planting_continue:
    # Call moisture_track and repeat the function
    jal moisture_track
    j summer_planting_season_exit

# crop_for_summer function
crop_for_summer:
    addi $sp, $sp, -8
    sw $ra, 4($sp)

    # Get crop number and method from arguments
    move $t0, $a0  # crop number
    move $t1, $a1  # method

    # Initialize seeds to 15
    li $t2, 15

    # Switch statement for crop selection
    beq $t0, 1, maize_selected
    beq $t0, 2, beans_selected
    beq $t0, 3, pumpkin_selected
    beq $t0, 4, sorghum_selected
    beq $t0, 5, watermelon_selected
    beq $t0, 6, groundnuts_selected
    default_case_summer:
        li $v0, 4
        la $a0, msg_invalid_selection
        syscall
        j crop_for_summer_exit

    maize_selected:
        add $s0, $s0, $t2  # Add seeds to maize
        beq $t1, 1, set_maize_fertility
        j crop_for_summer_exit

    beans_selected:
        add $s1, $s1, $t2  # Add seeds to beans
        beq $t1, 1, set_beans_fertility
        j crop_for_summer_exit

    pumpkin_selected:
        add $s2, $s2, $t2  # Add seeds to pumpkin
        beq $t1, 1, set_pumpkin_fertility
        j crop_for_summer_exit

    sorghum_selected:
        add $s3, $s3, $t2  # Add seeds to sorghum
        beq $t1, 1, set_sorghum_fertility
        j crop_for_summer_exit

    watermelon_selected:
        add $s4, $s4, $t2  # Add seeds to watermelon
        beq $t1, 1, set_watermelon_fertility
        j crop_for_summer_exit

    groundnuts_selected:
        add $s5, $s5, $t2  # Add seeds to groundnuts
        beq $t1, 1, set_groundnuts_fertility
        j crop_for_summer_exit

    set_maize_fertility:
        # Set maize_fertility to true
        li $v0, 1
        sb $v0, maize_fertility
        j crop_for_summer_exit

    set_beans_fertility:
        # Set beans_fertility to true
        li $v0, 1
        sb $v0, beans_fertility
        j crop_for_summer_exit

    set_pumpkin_fertility:
        # Set pumpkin_fertility to true
        li $v0, 1
        sb $v0, pumpkin_fertility
        j crop_for_summer_exit

    set_sorghum_fertility:
        # Set sorghum_fertility to true
        li $v0, 1
        sb $v0, sorghum_fertility
        j crop_for_summer_exit

    set_watermelon_fertility:
        # Set watermelon_fertility to true
        li $v0, 1
        sb $v0, watermelon_fertility
        j crop_for_summer_exit

    set_groundnuts_fertility:
        # Set groundnuts_fertility to true
        li $v0, 1
        sb $v0, groundnuts_fertility

crop_for_summer_exit:
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    # Return from crop_for_summer
    jr $ra

winter_harvesting_season:
    lw $t0, 0($a0)   # Load winterplanting
    beqz $t0, no_winter_harvesting

    # Print winter harvest information
    li $v0, 4
    la $a0, winter_harvest_info
    syscall

    # Harvest wheat
    lw $t1, wheat
    beqz $t1, harvest_peas
    li $v0, 4
    la $a0, wheat_info
    syscall
    la $a0, wheat_fertility
    jal yeild
    lw $t2, wheat
    mult $t2, $v0
    mflo $t2
    sw $t2, wheat

harvest_peas:
    lw $t3, peas
    beqz $t3, harvest_potatoes
    li $v0, 4
    la $a0, peas_info
    syscall
    la $a0, peas_fertility
    jal yeild
    lw $t4, peas
    mult $t4, $v0
    mflo $t4
    sw $t4, peas

harvest_potatoes:
    lw $t5, potatoes
    beqz $t5, end_winter_harvesting
    li $v0, 4
    la $a0, potatoes_info
    syscall
    la $a0, potatoes_fertility
    jal yeild
    lw $t6, potatoes
    mult $t6, $v0
    mflo $t6
    sw $t6, potatoes

end_winter_harvesting:
    li $v0, 4
    la $a0, done_winter_harvesting
    syscall

no_winter_harvesting:
    # Handle case when there was no planting
    li $v0, 4
    la $a0, no_winter_planting
    syscall

    # Reset values
    sw $zero, wheat
    sw $zero, peas
    sw $zero, potatoes
    sw $zero, wheat_fertility
    sw $zero, peas_fertility
    sw $zero, potatoes_fertility

    # Reset moisture
    sw $zero, moisture
    jal moisture_track
    jr $ra

yeild:
    lw $t0, 0($a0)  # Load fertility
    li $t1, 5       # Default yield

    # Check conditions for different yields
    bnez $t0, fertility_true
    beqz $t0, medium_moisture
    j default_yield

fertility_true:
    li $t1, 5
    j end_yeild

medium_moisture:
    lw $t2, moisture
    bgtz $t2, high_moisture
    j default_yield

high_moisture:
    li $t1, 3
    j end_yeild

default_yield:
    li $t1, 1

end_yeild:
    move $v0, $t1
    jr $ra


moisture_track:
    # Print message
    li $v0, 4
    la $a0, moisture_prompt
    syscall

    # Read user input
    li $v0, 8
    la $a0, choose
    li $a1, 1
    syscall

    # Check if input is 'y' or 'Y'
    lb $t0, choose
    beq $t0, 'y', increment_moisture
    beq $t0, 'Y', increment_moisture

    # Exit if input is not 'y' or 'Y'
    jr $ra

increment_moisture:
    # Increment moisture variable
    lw $t1, moisture
    addi $t1, $t1, 1
    sw $t1, moisture

    jr $ra

summer_harvesting_season:
    # Print message
    li $v0, 4
    la $a0, summer_harvesting_msg
    syscall

    # Load values
    lw $t0, summerplanting
    beqz $t0, no_summerplanting

    # Print yield message for each crop
    li $v0, 4
    la $a0, yield_msg
    syscall

    # Calculate and print yield for maize
    lw $t1, maize
    lw $t2, maize_fertility
    lw $t3, mulU
    jal yeild
    sw $v0, maize
    jal print_yield

    # Calculate and print yield for sorghum
    lw $t1, sorghum
    lw $t2, sorghum_fertility
    lw $t3, mulU
    jal yeild
    sw $v0, sorghum
    jal print_yield

    # Calculate and print yield for watermelon
    lw $t1, watermelon
    lw $t2, watermelon_fertility
    lw $t3, mulU
    jal yeild
    sw $v0, watermelon
    jal print_yield

    # Calculate and print yield for groundnuts
    lw $t1, groundnuts
    lw $t2, groundnuts_fertility
    lw $t3, mulU
    jal yeild
    sw $v0, groundnuts
    jal print_yield

    # Calculate and print yield for beans
    lw $t1, beans
    lw $t2, beans_fertility
    lw $t3, mulU
    jal yeild
    sw $v0, beans
    jal print_yield

    j done_harvesting

no_summerplanting:
    # Print message if no planting
    li $v0, 4
    la $a0, no_planting_msg
    syscall

done_harvesting:
    # Call moisture_track
    jal moisture_track

    jr $ra
low_moisture:
    lw $t3, 1
    beqz $t2, no_fertility
    b done_yield
no_fertility:
    lw $t3, 3

done_yield:
    jr $ra

print_yield:
    # Print crop name and yield
    li $v0, 4
    la $a0, crop_names
    syscall

    li $v0, 1
    move $a0, $v0
    syscall

    li $v0, 4
    la $a0, yield_is_msg
    syscall

    li $v0, 1
    move $a0, $v0
    syscall

    li $v0, 10
    syscall








   



