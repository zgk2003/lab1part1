################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../source/lab1.s.s 

OBJS += \
./source/lab1.s.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.s source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -D__REDLIB__ -I"/Users/zhaiguankai/Documents/MCUXpressoIDE_11.5.0_7232/workspace/lab1part1/board" -I"/Users/zhaiguankai/Documents/MCUXpressoIDE_11.5.0_7232/workspace/lab1part1/source" -I"/Users/zhaiguankai/Documents/MCUXpressoIDE_11.5.0_7232/workspace/lab1part1" -I"/Users/zhaiguankai/Documents/MCUXpressoIDE_11.5.0_7232/workspace/lab1part1/drivers" -I"/Users/zhaiguankai/Documents/MCUXpressoIDE_11.5.0_7232/workspace/lab1part1/utilities" -I"/Users/zhaiguankai/Documents/MCUXpressoIDE_11.5.0_7232/workspace/lab1part1/startup" -I"/Users/zhaiguankai/Documents/MCUXpressoIDE_11.5.0_7232/workspace/lab1part1/CMSIS" -g3 -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -specs=redlib.specs -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


