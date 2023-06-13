/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dcandeia <dcandeia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/30 15:17:47 by dcandeia          #+#    #+#             */
/*   Updated: 2022/04/12 16:27:35 by dcandeia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/mini_talk.h"

/*
** Parameters: ./client [server-pid] [message]
*/

void	message_received(int signal)
{
	if (signal != SIGUSR1)
		return ;
	ft_printf("-----------------\n");
	ft_printf("Message received!\n");
	ft_printf("-----------------\n");
	exit(0);
}

void	send_byte(int pid, unsigned char byte)
{
	int	i;
	int	value;

	i = 7;
	while (i >= 0)
	{
		value = (byte & (1 << i)) >> i;
		if (value == 1)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		i--;
		usleep(100);
	}
}

void	get_info(char *pid_string, char *message_string)
{
	int			pid_int;

	pid_int = ft_atoi(pid_string);
	while (*message_string)
	{
		send_byte(pid_int, *(unsigned char *)message_string);
		message_string++;
	}
	send_byte(pid_int, *(unsigned char *)message_string);
}

int	main(int argc, char **argv)
{
	struct sigaction	actusr_c;
	sigset_t			block_sig;

	if (argc != 3)
		messages();
	ft_memset(&actusr_c, '\0', sizeof(actusr_c));
	sigemptyset(&block_sig);
	sigaddset(&block_sig, SIGUSR1);
	actusr_c.sa_mask = block_sig;
	actusr_c.sa_handler = &message_received;
	if (sigaction(SIGUSR1, &actusr_c, NULL) == -1)
	{
		ft_putendl_fd("Error in sigaction", 2);
		return (0);
	}
	get_info(argv[1], argv[2]);
	while (1)
	{
		sleep(5);
		ft_putendl_fd("No signal received", 2);
		break ;
	}
	return (0);
}
