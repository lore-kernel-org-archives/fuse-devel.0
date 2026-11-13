Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573510;
	b=crugf7ALXHiDRJrvzodMFf7BpenEWvEX67pp5hcZqCpewwVdcCOFxnvfLTo80kHlWCg1
	 kbn2Tjne+oR/kEbCqyh+ZeKqH3/e7ZpE9es84Zrf4cDYxw42wHyTkD9+WSBkzOfEqnDp0
	 YFl5eqq+fJo9L7cb9XPXmS7To5lj8xZB8om4sWTecsGrAYFz3D0aJc0g4SzahxGoHxDrv
	 up/QNKxVGaE8ofDCZSJbO4oVWOpff40M1EhZFqvpfbDTUIqExL84jEJ+nM3M3U38zmtnH
	 sDIrShKU/dEbT4S1xBW+Jbt92WcIjWHGahP7B64+QFmBNtDojACgIMcVA4Qijjfaz8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
	b=fue4VSL5W7p1KHfIh+FtwBbX2mlaxFQjON/MW4VNAE5DgWbBnXyPX43g5/94VC16brQq
	 3U3ryzrzJm/HCVTrXlVBAW8E0gQJ1W/WH0d6Pu4H7STblrgz4bvKhdgOgb7QKFhxJdhm2
	 pzi4cl6f+WfRnNMXtVmL223QGzy+tnhVHFMwUm/KZHhMD3tOXHHv/f7/Jgdr/H2+OZRU1
	 NfScB1rWD6+R902QKPRZ/RDlNBUvQ7B/fzQBYfjvVXYxgx2XdFIHQ9QFhlwvAOcq/Cz+2
	 DHpe5wnF70pXuh6XIEEpjggg2iCev4EXrkUhHaFNlT0oZd5b88zCpDAHPJP7rGyMbag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mcKaUtOY;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5E606A323
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 12:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A5E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mcKaUtOY
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9108255e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 04:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573508; x=1795178308; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=mcKaUtOY/8jjtvzRE5qjUlv9fzWN8ZvABpSu3SQX+v+XSJ2RFcC9malGCf3/dlbzK7
         /nLavONCv2LzTKlliQtJQBtOF7VlURcs39Le3LXRxZkUgnCL27FlI4LG/nLao5uK70R9
         54cPKpqz0XAsR5ZhZ6+xJt+jCGosym81QeL197lFwBtxxOI1IpKUAkAFToqUL2Q6m26Q
         Zh/qNrNZ7YjApnYTAx7mCWhe+KxZM71gT4Fmfl7V/q9HWNwsz+RRAqbJL3D9JsYOyh89
         uJrDipXKn+1J8Y+KdTL6+JP3bp36G8Z5U8KVX/eYE6uOrFBPYtw+R9W9osHvG1G9R9lj
         SWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573508; x=1795178308;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=TJFcwe7WDWnEI553ih6kFfZlOwgQb4HdTvPej/KEFn7JLBGDLavF06ZSme1BZVIDFp
         oM6DJrw4hQehbW5gu2aPcvV4T/GrfRQy1xlQZpBnVQzOwsFNwq/PPlf8sAJxfPaQ/3F6
         hbNWLiRpaxpDeCV+M2o925lUkZaOSLsDl0PV+z8jDaV90AnZGWQT8wqDUDH8myS+PPEG
         WsQvbtaa9A3MXkHRoXtk6fCc6uDxPPdvTDizsR8NTNZF2TC6MhElHzkWa2SWkw4RUxSZ
         I48J89NU08TL6gvPpB0GtuxHxg83eDyt93Ya6ahjZnDZmSa2JIJvO3MKNNyQojxZMIcx
         iZMg==
X-Forwarded-Encrypted: i=1; AL+hErHiUvzgn2Kd4RNUrmncCZpe3UWBAe14ay8lZ62oSyWcIZgagDrrbcMjakbxHIZLtteK4Nvk+UzJsmOX@lists.linux.dev
X-Gm-Message-State: APuU4Z8OxpXmcx9XWODEaSDLuCLXZeIb5wHPPvLr3FBrjSAh+Y+enIFJ
	AZsUTBgOZE/RNj3bPKrFXvJtDV+zC4KjZu4qqOgPrTWkHSqnRiWBuBJ1w4D4c9oTG3u9
X-Gm-Gg: AYBFou3sbWaEH08idwpirgMuWcvZ6xRnVwojj1tWjAGiCC/9afFznP01UeYTVnRbDN9
	ZKwjkwls+XxnG7/0uvr0nMan4fTZkI5au0Y3+01NdkIxnVFFGMl7x42aVxbyrs13NT0O4NMmdcU
	589Xc96AhuFNU3sUqEeqBjoehrpQeRu61uXw3ybx/BDk4/IwYKr0VEYpW52dNjoZ2vxyDgz9FOr
	LcHfpPfowL84R+B4hz4JdCAgiO56208GXh7bOyQwZiLTjusTAXhINDjk5MereAnUSQiuG8Lau+M
	+X+8ZcLTtyItjoszO7F+KgFOT1UpSFq2KQiXO3BrQcNVLX2k1QuTyyR8krcGOXLVlV/2ifBU5D7
	fAtDSHLtdLX1G04+sjh1v4LhZbT3Kt2A3kvfxca/oghpH7dA75mJe5hiWw4G+9weqeIo4WGg+AK
	uwsPoKfDKGH8NFTPzqCBSMy04krARXBDLNiMIAAsTZ4Kwcpzs1LmE5O3nH7aydSEHPOZwFiD5lk
	ay61v/LiMItum+ePzNnChVJ//MDHXYV3NhGPEZNN8X21BYnXAzEX+VdyaLuXKZQP7Tlg9+gE48n
	J0QsfIeruPcvAuIBO7RNdUvUiTT2W44vdy11htGho0TZrCxyRh6Dw3kUzEqGEaA=
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr24790785e9.11.1794573508217;
        Fri, 13 Nov 2026 04:38:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm48348475e9.2.2026.11.13.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:38:27 -0800 (PST)
Message-ID: <28a33fa649dcaae2eadcc934ec49fa591ec1c283.camel@amutable.com>
Subject: Re: [PATCH RFC 20/41] apparmor: use fc_init_pseudo() for apparmorfs
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
Date: Fri, 13 Nov 2026 13:38:25 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize apparmorfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. apparmorfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/apparmor/apparmorfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/apparmor/apparmorfs.c
> b/security/apparmor/apparmorfs.c
> index a99366467217..351ea3a7120e 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/rcupdate.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/zstd.h>
> =C2=A0#include <linux/string.h>
> @@ -263,6 +264,7 @@ static const struct fs_context_operations
> apparmorfs_context_ops =3D {
> =C2=A0
> =C2=A0static int apparmorfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &apparmorfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
