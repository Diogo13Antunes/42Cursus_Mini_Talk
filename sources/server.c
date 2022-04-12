/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dcandeia <dcandeia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/30 15:21:25 by dcandeia          #+#    #+#             */
/*   Updated: 2022/04/12 16:59:24 by dcandeia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/mini_talk.h"

void	check_null(char	*string, pid_t client_pid)
{
	int	i;
	int	counter;

	i = 0;
	counter = 0;
	while (i < 8)
	{
		if (string[i] == '0')
			counter++;
		i++;
	}
	if (counter == 8)
		kill(client_pid, SIGUSR1);
	return ;
}

void	init_bytes(char *string)
{
	ft_bzero(string, 8);
	string[8] = '\0';
}

char	convert_binary(int binary_nbr)
{
	int	num;
	int	base;
	int	dec_value;
	int	temp;
	int	last_digit;

	num = binary_nbr;
	temp = num;
	dec_value = 0;
	base = 1;
	while (temp)
	{
		last_digit = temp % 10;
		temp = temp / 10;
		dec_value += last_digit * base;
		base = base * 2;
	}
	return (dec_value);
}

void	print_char(int signal, siginfo_t *info, void *ad)
{
	static char	read_char[9];
	static int	i;
	char		printable;

	(void)ad;
	if (i == 0)
		init_bytes(read_char);
	if (i <= 8)
	{
		if (signal == SIGUSR1)
			read_char[i] = 49;
		i++;
		if (i == 8)
		{
			printable = convert_binary(ft_atoi(read_char));
			ft_printf("%c", printable);
			check_null(read_char, info->si_pid);
			init_bytes(read_char);
			i = 0;
		}
	}
}

int	main(void)
{
	struct sigaction	act;
	sigset_t			block_sig;

	ft_printf("Server PID = %d\n", getpid());
	ft_memset(&act, '\0', sizeof(act));
	sigemptyset(&block_sig);
	sigaddset(&block_sig, SIGUSR1);
	sigaddset(&block_sig, SIGUSR2);
	act.sa_mask = block_sig;
	act.sa_flags = SA_SIGINFO;
	act.__sigaction_u.__sa_sigaction = &print_char;
	sigaction(SIGUSR1, &act, NULL);
	sigaction(SIGUSR2, &act, NULL);
	while (1)
		pause();
}
