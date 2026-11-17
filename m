Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904006;
	b=hFGcYoNbHL5lf6UjxFWHZTC382Xyvqp+zjFmacnyz/iLZNMxagUSEWcwzdHEZZMgKudm
	 FKNRytozLyVS6Gx6GxS6ccLZvmLAgMtfqdbzuuF4MfLGz0PcEMKs3f4lqmQqxfFRz+ZN7
	 00Cnf0w6/FGV1+EU9pEZZrFqbw4ZmwVf52GNrTmrcB4Y+G0yMW5V/CrTdcNe0qSAYWN8l
	 upAjvYvYOhcVw7NQrwTDdS/g58jr7RcP2yFtNMJEawpYBQZXnSrBeg62PAqSCxPAK3Trd
	 FZvGxIEbko8oJjwen35vdYE8FPuutNUiEM7hRTNeq6OYba5Ww8vE3ZBwkkCOMZOBz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
	b=lJrc2bDCFLEDjFoQrQ0dqFOvl09Ty9cGuTnDePEWFJypRgZqowRr3QMPpq5OgEt/K6EH
	 HzgF5UpBdce5Amio8RSt8aPpRHOCf54wGijA/XsNa7UjXzgxetHvd6mLSsATpNNtkCire
	 HPK2fCIW8TAxnMzJ1AYBcd9tqU69nLDDrce1XuHdItOM84930OVv4SJSAu0t3qU2V6SkF
	 LlYmCKH+aACsbAoJFaGEqhioo+q1mc/TOKRAce0cwivTqLa3NoE9PyAg9rbdh0I3VL5pc
	 SHmXxJirFyRXw//eaBfpH7tBoznxgtg3EhMkdMs4l/h1ZvxhSBQDDCe6rtcStDx+RFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="UKx/RrPm";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0B606A330
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D0B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UKx/RrPm
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so2231633f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904004; x=1795508804; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=UKx/RrPmhTGldtHcfNG1qU06hYbmnYn6ZCuGn4+mgezWIxVLxDzivpXn6Vdm8/jTeq
         rkLosPz8rrOmfca/qo6oc3FA6PSosLfoEh6amUpvZmrfz2vaxIR5gCAgV6vOXoxrdF6S
         ywgoLmnbiCyWISTpdApT1lx7El8xD2MZvlNS69BIkgbPo4T1pXiil/kIMSgFWS1eTDed
         jhQkUclN+rXRAOcCLj5SaNCl+w9clNstd6Ti45plGw4Shd7+4/vjtp3IgtVeyFsrSSzP
         XvLxVPUJG5W04x9O+YEr1sJtRRNtNb59KKdhN6pYjAoASAxuPjxC6jzgtPFHNxsSGppk
         jlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904004; x=1795508804;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=DrO1AEI9C8XBd7Lnva1nFf/bItCuM7Ozb9TY7y8VmOX3zISX+xZCNjk8OCqMoaeD5n
         huAXU/JSyx+5OXqC+plyRrZGF7xxRdSGx6d7zbXItsT3ucxPtj5gkMRRG+5q4vnM7X1W
         VH9zncNevhlsb1ukRxdF01YSHaJDmk0qxnhyTrbTc74XiEx+o90VkcH1G1W6Wqx04vJn
         EfIhrh3F3ucjIeOjRnKJkVi1e1O4cNNkr+Y9/lOc3DJ6aCRzLxfa4D/F7grh3DM4uoaa
         vuv8yriE1lT5/qqpKM8LVa5IUVfgAzs+K1fWqNbmX+kqynL24alVmaQ1aWw/h+IqI0WI
         TtoA==
X-Forwarded-Encrypted: i=1; AL+hErFCKh8AJerXlZewjTFH4lOppiHttAJAo2VxxGeXYE0SOJg1zmHg5pgS1Eji0fkqL7TWmWMH8EfPixVC@lists.linux.dev
X-Gm-Message-State: APuU4Z/3iuWGzY1mLYtTe3TahpgwmMbzA9aOVv0XHcB7VucipwqjI671
	AlxwZzFUAVC++cRTYIxyPLizzycf97Z9nwShuisPCX1ckRDprkYC7WNdPHnW6fbgo/d+
X-Gm-Gg: AZFdTZf1W7x13SW21X52Ugip02fMaa0bc8iGEwaDn7AEyrkKsAfFKdrHsovsbyPxCrI
	7qvoUji6WtrDYZHsEk12UbTjFAnLUu5XhPIX4y5VF+MZKeElWXE/SnZwJFBR26sGzXACA30QES7
	WVQfIXlRy+5Iun1iPqWOoKZ9DXujOhdkYoWKMmn5LmTy0bzN9giZfO86WjnUwc/3ZqRXLq7J/Jw
	tadUQ/yKCTZv31dzgzV75VDEjQ+vD2UguSoicxz8xi/R19oKryY6jWlL8mmWpMGmoppfHX6ekWd
	0EE4+1CY53IGDf1iYvI114iRWXzZC0dL/3wYolnUptheS45QQ75pQALOPD0JQ1zwOFFujtLHsoH
	ipBj0Tk0lWwzp7mKnWRwDAigBIEjXqZKPRhCplnyb66iurWByIZH3+qZ5xUGagnA67xSBxK7WgA
	aJ3fxBWt76WMiAxoppcZRk9vVz+crS74NDapfworr7q6Bq7t/dMhEZjgVORwO4ujlMVfGFiCUOA
	lqXt3dhno9LgiZ5adUbey7IrrBdeDUCoqN84l6GWoOrpt4A78Mn5lXfTBBYoobsz3ThenxBfArC
	xVMSDNfSW3UsW4TpcDyRmy3rsLHRttg7RJJcUNpSmB2T3ilFkbTZyYz79u8Dh22hzh37uONlKWa
	sZXw5F6dfDilYTBtD2MQFXr7B26j4x8deZLf8KhSi3FpfaWbyeCILien2
X-Received: by 2002:a05:6000:2009:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4a52e6a947bmr243585f8f.29.1794904004601;
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm977858f8f.8.2026.11.17.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Message-ID: <c43d70badf41f62f8e149ac024bab3df979fa756.camel@amutable.com>
Subject: Re: [PATCH RFC v3 11/44] failfs: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:26:42 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize failfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/failfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/failfs.c b/fs/failfs.c
> index 437cdc981c2de..f03334f361c0e 100644
> --- a/fs/failfs.c
> +++ b/fs/failfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_struct.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> @@ -132,7 +133,7 @@ static int failfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fc->ops		=3D &failfs_context_ops;
> =C2=A0	fc->global	=3D true;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
