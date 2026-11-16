Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794849420;
	b=S2noyBZ5QqPF4yw+bOjp7H0v2SLZorZkefWtFfWdo898whVvc7VFoRxMHx0Ja7/hcC7F
	 pOoyCtk5o5zdgXTLCaGG3bJg+PcKaDFmqC5j9BV4JA33RJLZiFTe0ePEOaHlF+o9qBiPx
	 iHHUOzbbvU4z8/5D65prOe/0z2G/KHro/4lIwyz8WapreJyfYeo4zt3bG9RKFCj1npP3S
	 CebFum7tWeWr+Yu+K3sVioU2JPGn7szbLbXRwgHpnDjkER5D3oFRdADJM+FOE6XmqepQV
	 01D7Gz/3w+Mya5ZHb+uDCsxnWY0hok4irbDiPiVCdmk3zTjZAkR0mXJ9/30pQpMt0BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
	b=SwgjrGPMKBvqykH5356JRsc4CZn6T+OcEexxMvDbya59hU6tzcluBY9GZfu2hFgHgWxM
	 NoXJuvuu1AK/zPd2cfgJDWKykDsb7Yqw7HlKYdA9Smkae0l+buEPLPiPoavg6OFQzmlNR
	 8XG201evf4PY2O3gizMEO/Kbee2THZsXbqygG5n1NUjhq9kNL93tJwDcJ470kR4fp1E9n
	 PgNheLjQYlsx3Gx5FZnMBkzxqL5QoppBMgKemUHu93I0ajzwV6+eyro1eGTMwAimsXy5P
	 6nn9bwhJit1H3O2sscc4a1pFt53UFmXOUV4SU3Q606WRhRiey0bcxDF7CwxAL9Lh5yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rijk7zwv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88F2606A88E
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 17:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88F2606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rijk7zwv
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so5782812a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 09:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794849418; cv=none;
        d=google.com; s=arc-20260327;
        b=qgy8gxyexbRPuXcjBRkU6G3s+esqOw4odJOnTlyKf8Kt6qN33qc3kf0JTM1ET+WWuv
         Y7mn9RsDeI8OPfyslupi4MOB9BMhBoG0DQc89Be+hPTFqZlUywtESGz7GOh1/DWZvXbI
         d+1iTPJrIpnHMg3yYyY0F9f85eN2F8qS4QPeaEa4FZaSMfLtusoLNW5deX56w1IYMi4y
         rcoU8+4/Kycb3HG0YjT2MIhUCQ81Qprgr19B9b3sK+ZDbgz4R8NgJONCwnA2kqoT0/7J
         92xBx+tsx2Kk0BkNqhH299BCrhYpPuCXI3QPTMdKnenz3eSRWKmLWox6Hb+2m438ELbH
         uAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        fh=OPGs5yjcZySBk1+h+mS7ITOxpP1xDBojcPFMMEHxXk0=;
        b=ll9EK1smVLBT9jboSiWWS+XeNpg3uwntAcsJcpiKI3OwCSpYznPQlFeD1mu5be0dp7
         iXW9MQG8FbR8v7+sSKyIA1a1na0c7RPDdd5GxmNEl0QTMkuGHtPBfjMtSrB/CLdqG7L6
         89P8kb/2xgQ5Qrr5NSZWb0fTc3O3++DgLWQ0rii0O5VWNdcL4+Txl45P/lxW8PxE5Ah0
         UR49BO6JBBzYs/AjgvE3sYogB4YAngJZ0TF4AFDOrCk9//AHmJcA0zjLYAw8U85D10Dh
         BVHgCWlcJKHSaBjalU4GPufkXBt11Hk5dX5E/Tk07VCgD2USqaQhWQ4xTLLUZ0faDF+H
         oh8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849418; x=1795454218; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        b=rijk7zwvxvIN2K/SO4BzSPDnARxVE8Hp/iNu9dV8/uKqxAYxhlKb92ELGOg3G857hw
         XADzmQKP1SQwSXLWcgSnZROMvBsJNTqf2TFOydlXoZU/Kj3x5eiFJ5Z+4maNOxf9OK6Z
         v6WOrCmbk/N12YoMk5/UiW85Zp1RR8EocRBVQVipzFk83mJ/VB0QN/VxMvc7cQETzdPP
         S0ZtiEFJaXIJK5iaE4gJ4CZORpxE4LLgxIsLhoL7/vGSp/yGY1EAWPb4w2QoztQdWn57
         ulvHofyoa3bctRJDuE7EEum55vjWA+IEki3y98AEaGtNOSVPxR3JnU7DuuI6FQn9tsCa
         IgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849418; x=1795454218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        b=VGE3JED0NnjaGCgPQl/2TGirx36SlxY6ODnG9VxHZXeiavcNPVesps+6G88CSxFO1B
         Q2HASiAYnstXizmZKpWUQEyMU6BqbRXrPDSszJF7HWat3eaFdrp4vc86SllRF8at+Vpo
         EJhf0JvzzpT51KyEYbEYzDj00cMEQsczfscHRCbXaLWq6fFZW7ivp43skJ6PrtpmYwXi
         cfLpZqXA0XuC30L6XQkqXGxshUubnzRpZh48oKTNHRPgIJc2bjLGycyVMp3RimfhaOg9
         I2phsy9hx49+scMY+537BjNFxoa6YsRFtXL6TuIT+9yC67n/ES+thhvwafg5mGY7pxDm
         Og2A==
X-Forwarded-Encrypted: i=1; AL+hErHHjFl4DxG6jkwGcl95c0nW4YGnx1YY/29iqQKwdDuhNeUTnV7ZaMghSHl3OIYsNG2j8LjmKlhFMpRW@lists.linux.dev
X-Gm-Message-State: APuU4Z9g6vx+TiK9F5EriNPNStRj8SXcPgmV7l2wjPPApvP7uPDqW4bc
	7XxukomX10KR7haZPYxjDs93la8dndwmfhAKeLHQhbUIXz6xU6tnpeLYEX/i+ojBgzqO/FJT9CX
	Y7d0CSQoXmf1JmJQl/QPvSDT3ii3nw9o=
X-Gm-Gg: AYBFou3RO12V0OnesqFRNJ2YY//hvb/jne7BwATqTMcF5v2ucriupF9spm9DC2fKlRD
	9OTuKsIRja5+3d4C3Zh/UubttyVG0gDTLWjN32FiY9uC9CBKx6kqijK/+e/Lya/xIe5x0SqD4Eq
	4vCLxAHObRcK+yi5C7j8u08xZ2Gw0MgmyvlAVuQlChHuwiwVfKgKu+denlua/1st4uwjPCnlHH/
	YGFf781Dg7ebey3+1JzXJPBAhFWrAhKwWHMgEQP5Lum0maman3r4+18cELd25pTmKOTMlR/Xuo4
	Yh5nTAUekWYfbVE0hTgJrQdNFAbABCbkgmdBpl8VVcBr7Jrt1OWtBXDubvZSLh3HCMCQG/JIf0H
	ak3QnQME7uTDiI7zy1ewld8cPdlErZgxlff0pY8/obnJVBAI5+NdA12HyQL7xjKJwS3vsgi1zm9
	e/jJMqN7ooUEJ/rd8=
X-Received: by 2002:aa7:c258:0:b0:6b7:d69a:a3d3 with SMTP id
 4fb4d7f45d1cf-6b7d69aa8fbmr5089335a12.39.1794849418257; Mon, 16 Nov 2026
 09:16:58 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-34-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-34-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:16:46 +0100
X-Gm-Features: AclHuK_s2Kpb4OdbgPngYJl9gLHjfhlAmiJMqLtxRnpTDibz-Ni4SZJspSV9laM
Message-ID: <CAOQ4uxjJVgy-skUbbScfz=eAEATf=iMpqRHNshX=eKu3oiwnrA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 34/44] selftests/ovl: test data-only layers on
 pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> Add tests that overlayfs refuses data-only layers on pseudo filesystems:
>
> - sysfs and procfs via the "::" separator in "lowerdir=3D"
> - sysfs and procfs via "datadir+" by path
> - sysfs and procfs via "datadir+" by file descriptor
> - tmpfs as data-only layer
> - sysfs as regular lower layer
>
> The last two must keep mounting.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  .../selftests/filesystems/overlayfs/.gitignore     |   1 +
>  .../selftests/filesystems/overlayfs/Makefile       |   1 +
>  .../filesystems/overlayfs/pseudo_datadir.c         | 131 +++++++++++++++=
++++++
>  3 files changed, 133 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/.gitignore b/t=
ools/testing/selftests/filesystems/overlayfs/.gitignore
> index b343cc430051d..e1410fee2269d 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/.gitignore
> +++ b/tools/testing/selftests/filesystems/overlayfs/.gitignore
> @@ -3,3 +3,4 @@ dev_in_maps
>  set_layers_via_fds
>  idmapped_mounts
>  automount_in_layer
> +pseudo_datadir
> diff --git a/tools/testing/selftests/filesystems/overlayfs/Makefile b/too=
ls/testing/selftests/filesystems/overlayfs/Makefile
> index 382a59bda5e70..ace75f5627e0f 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/Makefile
> +++ b/tools/testing/selftests/filesystems/overlayfs/Makefile
> @@ -10,6 +10,7 @@ TEST_GEN_PROGS :=3D dev_in_maps
>  TEST_GEN_PROGS +=3D set_layers_via_fds
>  TEST_GEN_PROGS +=3D idmapped_mounts
>  TEST_GEN_PROGS +=3D automount_in_layer
> +TEST_GEN_PROGS +=3D pseudo_datadir
>
>  include ../../lib.mk
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir=
.c b/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir.c
> new file mode 100644
> index 0000000000000..3b59fd3e9f5c2
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "kselftest_harness.h"
> +#include "../wrappers.h"
> +
> +static int setup_tmp(void)
> +{
> +       if (unshare(CLONE_NEWNS))
> +               return -errno;
> +       if (sys_mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL))
> +               return -errno;
> +       if (sys_mount("tmpfs", "/tmp", "tmpfs", 0, NULL))
> +               return -errno;
> +       if (mkdir("/tmp/lower", 0755) || mkdir("/tmp/data", 0755) ||
> +           mkdir("/tmp/merged", 0755))
> +               return -errno;
> +       return 0;
> +}
> +
> +/* Mount an overlayfs with the legacy "lowerdir=3D" option. */
> +static int mount_lowerdir(const char *lowerdir)
> +{
> +       char opts[256];
> +
> +       snprintf(opts, sizeof(opts), "lowerdir=3D%s", lowerdir);
> +       if (sys_mount("overlay", "/tmp/merged", "overlay", MS_RDONLY, opt=
s))
> +               return -errno;
> +       if (umount2("/tmp/merged", 0))
> +               return -errno;
> +       return 0;
> +}
> +
> +static int set_layer(int fd_context, const char *key, const char *path,
> +                    bool by_fd)
> +{
> +       int fd, ret =3D 0;
> +
> +       if (!by_fd) {
> +               if (sys_fsconfig(fd_context, FSCONFIG_SET_STRING, key, pa=
th, 0))
> +                       return -errno;
> +               return 0;
> +       }
> +
> +       fd =3D open(path, O_DIRECTORY | O_CLOEXEC);
> +       if (fd < 0)
> +               return -errno;
> +       if (sys_fsconfig(fd_context, FSCONFIG_SET_FD, key, NULL, fd))
> +               ret =3D -errno;
> +       close(fd);
> +       return ret;
> +}
> +
> +/* Create an overlayfs with "lowerdir+" and "datadir+" through fsconfig.=
 */
> +static int fsmount_layers(const char *lower, const char *data, bool by_f=
d)
> +{
> +       int fd_context, fd_mnt, ret;
> +
> +       fd_context =3D sys_fsopen("overlay", FSOPEN_CLOEXEC);
> +       if (fd_context < 0)
> +               return -errno;
> +
> +       ret =3D set_layer(fd_context, "lowerdir+", lower, by_fd);
> +       if (ret)
> +               goto out;
> +       ret =3D set_layer(fd_context, "datadir+", data, by_fd);
> +       if (ret)
> +               goto out;
> +
> +       if (sys_fsconfig(fd_context, FSCONFIG_CMD_CREATE, NULL, NULL, 0))=
 {
> +               ret =3D -errno;
> +               goto out;
> +       }
> +
> +       fd_mnt =3D sys_fsmount(fd_context, FSMOUNT_CLOEXEC, 0);
> +       if (fd_mnt < 0)
> +               ret =3D -errno;
> +       else
> +               close(fd_mnt);
> +out:
> +       close(fd_context);
> +       return ret;
> +}
> +
> +TEST(datadir_sysfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/sys/kernel"), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/sys/kernel", false), -EI=
NVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/sys/kernel", true), -EIN=
VAL);
> +}
> +
> +TEST(datadir_procfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/proc"), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/proc", false), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/proc", true), -EINVAL);
> +}
> +
> +TEST(datadir_tmpfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/tmp/data"), 0);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/tmp/data", false), 0);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/tmp/data", true), 0);
> +}
> +
> +TEST(lowerdir_sysfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/sys/kernel:/tmp/lower"), 0);
> +       EXPECT_EQ(mount_lowerdir("/sys/kernel::/tmp/data"), 0);
> +       EXPECT_EQ(fsmount_layers("/sys/kernel", "/tmp/data", false), 0);
> +       EXPECT_EQ(fsmount_layers("/sys/kernel", "/tmp/data", true), 0);
> +}
> +
> +TEST_HARNESS_MAIN
>
> --
> 2.53.0
>
