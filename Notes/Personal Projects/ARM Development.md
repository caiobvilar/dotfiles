# ARM Development
```Makefile
generate_hex:
	arm-none-eabi-objcopy -O ihex $(CMAKE_PROJECT_NAME).elf $(CMAKE_PROJECT_NAME).hex

flash_mcu: 
	@echo "$(CMAKE_BINARY_DIR)"
	openocd -f tools/stm32f4disco1.cfg  -f $(CMAKE_SOURCE_DIR)/flashing/openocd.cfg
```