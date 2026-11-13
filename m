Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573425;
	b=x+UvqIisfuKi2hjnUe/KrTT5vemrg9EmrUh0PL+Vgox58atvsds8mbdbcItZxCU0HUq7
	 S/1YkGTwIQXetH7DydFwObfBvbuFqDmXARmTw151/ZiDKkKGOO4M3csvVaBBFmZpsuXpJ
	 BFh2MMVJZMok24yh+LYM/y4dCqpdS5aTFdBq+ddSNuLNK13JcbES/uJQE8XKqPQIUExf0
	 FlWcMiC+CH6yvH2l2fY+Xa4CzehZVaVTEKu+wr6SW1eQWp+2ShnhtJPa3LJP47OxTG5C1
	 WI3W8fFzrRn5tqhlBMksUuaxYerQGCEhYRZoDC5ozr+8JdULCZPNxdXqZgD8jvilI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
	b=FIH9lszXZ+XIizDgqoEYEvA+b9DujOrVTUxjFdykSrFuR4ty8yR9rRNGMID9b4I0xV6C
	 dvUdjfVG+kfIKkc39sKj/WDmLgXxNdtZ3pXaocoLxT6Z7dtxhJbuzUTwl3j+hz9JhB6ca
	 TZw4pP74I/OPs1Bu5pTLy8oIKpaXedyEbdYRZUj3OpAk7cfBhy7qYM4eCZbr8A3Wp+pA+
	 THxkCdPDoeOCAzzCwRiXq20Nsdo2eqgXvUkF+7iZu7nXfTeWm7dHiyHcqVBDfW6zIlVr4
	 1hjzDDxAY3NUtIQrTb22JNiRyzSwokEsFCrvevLtlcLNCJgl/gEM0O7vR+E/rA24G/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Tu9p6NGc;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9155606A336
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 12:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9155606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Tu9p6NGc
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so3542105e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573423; x=1795178223; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=Tu9p6NGcOF4z0zLKEG8rFsAGxhnNNZ3YXRzgBjD+Zgvog4jzGewEr93mY+5QLqeJiY
         k/b4eA3nyJFT5mUkf19NIQbfgFGdNlwzoP+Gk8+ZauW72nC0Fe02lc/nAN0lHw+3/Zzb
         Q7cxGpm8N5h2I1opQc8PdtWBs8GH3ul5+o1cSuGLAsR9W7YSxaMm4TXumFn46mioHsGN
         wsmOFjqXVBlSo4Tx9r1r3V6DBkSTtq0HaddZAyi28yE2e5UZUa2jqd57XSlB5HF9QRFc
         DjugvFJHUM5nIyIm1TAdtnTGyuyV2W9USZt254Vrts4YGip+jRmUTEEn9h0DREuegwVs
         rUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573423; x=1795178223;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=vVUd7beBAuiUv7D0ftU7vsAZrE23xXv55OVSa6lg5oknQ2i8HPhURxyf3bl9gWRY9G
         h4cO7nQ4+1tGPOmTZpcz6xk1hV5/VdNOEh5UBN8P32vamaCXP+NCnIR6ZTFZ1QC/3bik
         nU57iwg/n+TIAhyH0DJdRdU7VaXs1it3Z0Ms1cKCLOwmYLSh7bGZCgGAEUz1wnoVG6xn
         5uedgaOa+brGwt7uPRah4YCnwe7AIQ83VhesGeplDxU27CllHb9b0qBj1kFsHMNb31HT
         7UTFx8L+J2GSaEIssEk2ZvSphj7zTr0g+Wc/Js3HKOw3PNLlN6NxGGXTblKw3G5j6ZTt
         +mnw==
X-Forwarded-Encrypted: i=1; AL+hErExtXXm3aYZk+irOyKogCrtThDbTzLRkXZdeCsF8gKfsqjU8etoWgGvcyzQ06n1YN9aLCAVgmlM5EDL@lists.linux.dev
X-Gm-Message-State: APuU4Z/B6hn6pMEcJM7O7+sh0goS3HQbX+ZzD5o5Ub78f6DGbqH5rf1i
	qpAmoRvfbg30HFKuk/cCfvIImFrztNHSphWJOJkdfIpg1GGF5DJBzvCRd7nHYdQ2Jkvu
X-Gm-Gg: AYBFou1MGTikPXag0eS8canZTEwa967QxGm4+oVtscJ6zvnGH5smFuYSiKqh/aw4Xdr
	bcAmbm8HLQyXyaUc4FuBvHmMDH1wLgaNzUp5SRJZTJA4qfNXzYjmCqvOxbMkJcYABbTXkZvi3RP
	3gliSQe8ro95N3j/0WUhy6kYR4Kd45noMb3lfQybi3OI+rJ0c4LGvDiWDTywqR7YFBf8Bg03uEt
	RT/1hFao9dld9bzZxJmJTuXo0R1ZvhCAOSEsYkui1LcLTaJOFrY6a0UvGy2ycw9c1exIAcRPsIO
	XEV+8M2nod/n9Fs66gP4JUlezZs0PfNKi4D3IdSbcnOEIhfxXBnS9y/t5BnrVu4Y16BJYvbNuFO
	KooFcNfhaGTXNkDMT467erWraQd7tFU/h+8kceTAqJ4ghzRh8Wv4BV+brzt1KKuk2XtmhUYTCIJ
	AGWRFlAWnlis1ODN9UkIkRb/NxYWSMudbaQa2XgLx7VdF4ymDx6SC9AuVgt3aCJyLqLXd3ldnzz
	zRVwRg6WHKHP6Z9mUHnSeIuqbw4felnvfunM52WyoXeLHoY59I9nhB14LNCSWK5e7a/7LsDflgh
	paSmuZZLZbVk7Ec9nhNh12Qa0KH7fks9LI8O2B7RJvVI6jjb3Wzr7rIr7MppBnQbOc6o2ZEFs5/
	mqg8NKfFK
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr49782945e9.34.1794573423157;
        Fri, 13 Nov 2026 04:37:03 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm57437255e9.13.2026.11.13.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:37:02 -0800 (PST)
Message-ID: <f12140be54ffc4d1e8e4026f80c41c75cf5727e0.camel@amutable.com>
Subject: Re: [PATCH RFC 39/41] usb: gadget: f_mass_storage: refuse files on
 pseudo filesystems
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
Date: Fri, 13 Nov 2026 13:36:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
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
> fsg_lun_open() takes any regular file as the backing file of a LUN.
> The
> file-storage kthread then reads and writes it with kernel_read() and
> kernel_write() on behalf of the USB host. With a procfs or sysfs file
> behind a LUN the host gets to read and write kernel interfaces with
> kernel credentials. Refuse files on pseudo filesystems just like loop
> does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/usb/gadget/function/storage_common.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/function/storage_common.c
> b/drivers/usb/gadget/function/storage_common.c
> index 75831f2c7abe..83683ade20c2 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -211,6 +211,11 @@ int fsg_lun_open(struct fsg_lun *curlun, const
> char *filename)
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(filp)) {
> +		LINFO(curlun, "file on a pseudo filesystem: %s\n",
> filename);
> +		goto out;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If we can't read the file, it's no good.
> =C2=A0	 * If we can't write the file, use it read-only.
