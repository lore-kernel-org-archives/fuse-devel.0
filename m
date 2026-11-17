Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904346;
	b=QewdQvkOSEbk4IxR+Ip1kHWWWgosvDVKi1PbG/QTm9OQSiq/zuxrkLt6osyR1p0XgEpQ
	 0PiqeKw6Kh02EScXGzA6t1R9Li4TFSgoATuaEQpDcArZ+hdJa+UlY60O5UJn4awRve3Az
	 9lp6OVi9sb8GQyBDl+yVsBIkIL57JoLyA42QdGXcOssafG/Oy+AOk12p1Ww/wi+XNBjni
	 yMDsd0WiFu++Zft7RrtaR4vVGujWFrKBGRYUb4VPZ5kYdwd2+dk5Smhdw5UEzLDNyYQ1G
	 NQGM2VaJZ3EHJEAs39+rdEEbko7gS+QZDfZq3Ihl+F6dJH21EcCaBG9RZE8V+qfHFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
	b=J21V8uqPN97ybFhNfqBjFXbE/zCCsScRd4L/9BEyU3dYmLbIR58wmZilMvufCr6FI9YA
	 nAbwbsTMGEv0yFnnXXit9cML6lzGEmNdcWQslYq8TESiWta+pvyfC7c1x5HEtekVsTxge
	 ZC5x0ed9buKCZ9UQ72y4GV+VhuKHBWyt58Xwf/4uPFsNPj9z2uoKu6Tz2r0HeiIuxuDJO
	 wj6hDIuDNhKBPIolBGR9kCf52brifQ0dxvRHIXIvwq2bPF64Q5mJyEUQBFG21hZ2NimeH
	 TkGmfpwcIs6fg8+uw9W+8RaLm2zYpGbfE5CkVh7CH9u+aIaGysQVcM5e1jWiqRtYutw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jPfu0DYs;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4053606A897
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4053606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jPfu0DYs
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so2235566f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904343; x=1795509143; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=jPfu0DYsnhQtr/mqX/UMkNCVP5/36h6J+OzgxseJXEKFg2OSvwC6DciwjVf8p6kVZk
         SYcOS6EtexiH85saG11Xzuyvcim3gsYZwLTKGUumi2TT1qWkxrcCpGY0jQUY8x///OXU
         EVYmlDEHqjmiBc9KhnXU57dwEnlwoyvy7D0MytltmsqUm7UGakcMA43tRGtj1OpGzvYY
         2BLFZns4KvnUVMkKQ6+cjLD9zn9J2bumSnbI3MQAD6IKY/VIH2b71H7xZ0nQNdYpdgAi
         3lmiG0z7sp8azGKk5UvTpMQwuUp9uqSFTU5ElbSr/7K2IZVRAMpHv8IfEUdM/eBYHdd3
         b3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904343; x=1795509143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=a5S8doO3PDg3Gp6pu+4xBAb4DVlq+AXuLVSyRy8owNezGODRN2phXO+J+8WymP7419
         d7dEsiPd18myXnWq7pPUC3EusjBkM5fn479MbDlS5RktilmGkKWuh0Uom+1ZI/Ouhz12
         NFikfkftj8XJuBXgJSCy1Mjbdu2vgToYI6ajebzLYMtfw2PHKwv8x2Q+c9pn9IlSoAVU
         Hbv/I+uwDvBsc4FKkEAo7w5u6R/j+5HVuAkaPXEpfrqxoVVyshEDWPI1RCujY6P8GdiD
         AT09LdngdZdQcA43SFO7cwKe1buQlCSNU4OivRk78xhtGoYGlkY3Zd8GsRoQDzjUVOXg
         kWlg==
X-Forwarded-Encrypted: i=1; AL+hErE7yo9RQYcrNm//ZVLwh9ZgAEM5QH7NQYvMqPZsEJQKfYuHf6hCmRbVBwdYCYbjHV6WmBqOWUjXNi9I@lists.linux.dev
X-Gm-Message-State: APuU4Z8zFMyH2HzQ1LJrzg4K7I6Om2hG7DTh0e3bhqFazf7rQlwDC6sN
	QxRCTlj1XxevAeNjR0ZY1DddZ0VOQI4I+gKDMaSbGlpu/6QJ036GbnFl1TBLZKM+Foqy
X-Gm-Gg: AZFdTZfH+wvsErf+YTr+Eh0UUVEpJurz6y6H7A3mmTnKIasVfn0KjxQ48ExdPOWsjLc
	e642V9Wzk2X6LBTtwsw8LHDcqaohKYW/6wRVBhLLyfOYtndydUqI9wIJPL3TkdEgrIjHk5DRr/5
	WRVEsVLVvlWHHscJQzQi0ZvisRi6LcBfa28J8WhWzqSIKeNbSnGP3z8xA7QteFS3dYE9SLmzVbe
	2uw9zrjzfpTxENIQ8hSEfo5AXEdEshOYZH64DLLQQSTTpS9FaD5bb7M1aLURfK6pJQHxQ+YVIig
	pelG+ZKdf8dxzU84a4VDellVeA0vby3zeHIPxCREFdbgPMRLU0WQ5K5IErrDX6rwPcQ/RRjXPvr
	G7whEPBpWQuIUFXHCGAZsDfGm2mXOLFcpWLIhuXzZ/KNoKyDBPs57CioPnCfjEjRRbq3AU8xUBa
	r/1Tdp7P1jT5x/O+FNZd0Xi1NoxXiA7fnBTX9N62JGaOx7FxfLSeNze3z8Qayj3WbClO2q6xPmc
	VnZUyz3MgUiWn7O8NE4FJYBUt08wPBRSl64STBzFZXwiezsrVf1uL/VWACL9W28dfnP5pP4I6N6
	zpAi+x2jxAL+nJusvcucmx3nURpuisfx9Lf8jBxB59cPQ+nMbAvOg3sM6YM2VB3Mgnlfjz5Po6P
	5ApQ6S/JeAS9eBNNUHH3vOstkJAbVLs2qG3EEjUeoSSyIvN443mh31R9d
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr27089117f8f.45.1794904343236;
        Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm43646659f8f.44.2026.11.17.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:32:22 -0800 (PST)
Message-ID: <fd39200976086130cc82d59699a988fc3e0689cf.camel@amutable.com>
Subject: Re: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 09:32:20 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/openpromfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
> index fb8d84bdedfb2..6cd02d456bac9 100644
> --- a/fs/openpromfs/inode.c
> +++ b/fs/openpromfs/inode.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/string.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> @@ -419,6 +420,7 @@ static const struct fs_context_operations
> openpromfs_context_ops =3D {
> =C2=A0
> =C2=A0static int openpromfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &openpromfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
