/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dcandeia <dcandeia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/31 10:26:51 by dcandeia          #+#    #+#             */
/*   Updated: 2022/03/31 16:22:46 by dcandeia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/mini_talk.h"

void	errors(char *error_msg)
{
	ft_printf("%s\n", error_msg);
}

void	messages(void)
{
	ft_printf("====================== MINI TALK ======================\n");
	ft_printf("Correct Usage : ./client [PID] [MESSAGE TO SEND]\n");
	ft_printf("=======================================================\n");
	exit(0);
}
