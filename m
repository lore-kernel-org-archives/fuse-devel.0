Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657338;
	b=soLesfrs83a9HgCkx/RaXIdsVSWykB2txn2Vtb1G68tOut47I92w9yTYC8bBx8GYWSXn
	 yqVDC8QSxfggznXZYKDg5bpV/c4YSUCpepDSjaliBl8BQjnwya9ywAvSC1AAe6rnuV5SK
	 zNNSmIyl9gZZAUms3TGpN/RKGXu+ZCp5E68yKKrpHjP0mLvmPSXZoZyPLTJZnMSPNm6oV
	 IdP1w7Yo1OYEbcdro8oUrsK/kC+jSQjXGRE1sh7danwDzrU7qbY/o/bntmDk18ciUVFV4
	 +SZ7W/+4BDMG9RS5SwbNyUOHZoD5OUZ2qYMu+cHeW2n1j3l22hYf+8Eecit0uuZoYdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
	b=sZ1nfYnUmSMqk+p03x8FqoN/7borCWzXHEi2y77bcEmnIJKIfOQ1yH+n1HqNMCTFjJgp
	 Fbs/fMhiCXqCjAVS3TFA0pv3XKGnRrQli1wg9m2A/cp/fsZ+KgqULkfMIsFIzc5QbntlI
	 cJL4PnUrrRbWg7K17lkHodn6BApSWLME3V9ObfTudbbw9R7mGVUqTkkp0lNXOOnkXjELs
	 3UCXpntI9HnWlWNZONVH3DJJP+cSMSRcnKSMWpAZymohnXRQ4aSll4S/uBlrCBQ4qcJKF
	 4usWxniQhvZcEGxiDYExk9h1cmOPTxquhvivYET7kN2pGax+VePMlenkqLN/2VBqqJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzHg5wFX;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66673606A330
	for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 11:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66673606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzHg5wFX
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so3206799a12.0
        for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657337; x=1795262137; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=EzHg5wFXockY2Q2XbmZ0Rn0jHLk3CY0hLNC7OoS3RrleaUIl+J6GzGG7YZ4Icf05w5
         Axum0xWvjOs2h25bZpH5InnJW178gL+Av/YpTMptaGuviJDc18kLohTeepllKubM/g1s
         hIoB4iPE0dyT4S1xGaue+1k589ir2w8yCC/z4kMhzDm+IEk4CVlTGK+Lmmgwehsg1x5H
         urnxdrpRqz8y6cwBmGE3tIJKXXERFmoWvaFl1y+yBe0LIcvbb+7WaxvBVDlYbbAPum/J
         9CX9jRbt1BONCtPVPJYOtRpHrgmVf76t3E/KYoYLfkA4ED5xiSUspf2abgm6uyvLdCIe
         GBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657337; x=1795262137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=MT6y3cCssKDasdFh5uWuyLXC9VC9vB3KBASxrHpzsja1WImLRpp9EcwdR+6hRVnByG
         ZDNEGniebpYkDQLK4O4bxtg33Vo1WNDbLZb9JuwDxKimcTR0YLeNvIF3iUH6rVchWfsp
         kiZV+jWrDSKcuvuQ3Z+eL1bk8oW9YdJNXvRqDnXgUlRQngno9T0OfkOUoc1X/x7QNzj6
         23zZ1p8JDR//3Iuq20ZnjGuNDuJbnQfqbBhFJAHk5LfB1byuzLfIlq4IWPQtz5pOVDax
         UfGPrvDRoWsMoMhHdVdYblixohfQyFbXj0wLvMSFeV3Vj9+lJWIozy6WBYbcRk3zlamz
         fZew==
X-Forwarded-Encrypted: i=1; AL+hErHYTGc49dTbMrN1+gou8Why7OCSdDWqTn31+4zep52MRLQ2InghRiuP3X5dSDRRK1rcmopNzm9ceaix@lists.linux.dev
X-Gm-Message-State: APuU4Z8So+mWmlRlvWgK2H4XiNRLQLnWbswA9jtlTxNoYUKNa/PzoVBK
	u8IOOmTK9a6LZClYkMQO6UXADyyQ3iY4JpdOxJjGpOBRRGG9Kq8hoOeH
X-Gm-Gg: AYBFou1MtHKHqQUWaJJQ+6kGXu5vqM7nmDDrM2OUBIe7kZ37JzX+itUpZXoIe8wkqh4
	NsAqOctgFK3J3sd4v7On1612LVJcKy4mH1Aa45FjBJqzk6+QfIHHpZ+nSDT2NdnWE4nS8WyVIgt
	3UlhgDTnwXENBJtLsNPC8oCUOxG3CBqsIqUy0AEprM4CyP3EBT+PxWEl98/dQ21C9A1lo3HzIKa
	qoZQu820laySU3FwB4T0is+RbcYv0/wC7hpHCdHgbVLQytKb/tDHMUsLiDazKytpWHFqtDoZmtT
	cLV24vr+6AiGZKEZjBGUTcsQTrAaqnvfgACDXBdmv+5vJhBH0O9e77XTKlIcPCn5Ae55lO5TwJD
	jH/POPfYXvqtA/q3fmYQDIxpoArFhaBRpPuWNz+TxW6yZJwIwwuZxa03OKzAcdjYsaJa/TAoReA
	i0p6QtjrIs4a0q9K43YZe4MP1QpwrPvJenqwh2/VGGhkKK96iv+mLldfSfZ/OvP584iMhA4ca4S
	rFN2PPSjV8768Y1hYOBwxvyILD8dzeNHhuSHRQhB5/ir0zgyhmh8NYKgLlMwLVQvzF5ytT+T3ZK
	yxqK8cnHHSKXGU18SEOHceVyLi4Va6nbmpQ2Sy+r1+9LQZvh7q8uMZEOwNUoPFgS78cwdl+gnNT
	X078snEg3bfU=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr441592966b.16.1794657336589;
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b41f44sm206223866b.31.2026.11.14.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Date: Sat, 14 Nov 2026 12:55:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avhMN39TECaur0sS@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
 <20261111151202.GA11391@lst.de>
 <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>

On Fri, Nov 13, 2026 at 11:25:57AM +0100, Alexander Mikhalitsyn wrote:
> Hi Christoph,
> 
> On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> > I've seen setups where people use fuse to mediate access to sysfs
> > sysfs in odd ways.  No idea if that's still around, but if so, this
> > patch will break it.
> 
> 
> Oh, that's painful. Do they use backing files for that?
> It's a relatively new feature in FUSE...
> 

Very unlikely that they use FUSE passthrough and if they did
very unlikely that it would break their filesystem.

The API for fuse passthrough is that the server requests to setup a
backing file before open via ioctl and if ioctl fails (as this patch
does) then server falls back to non-passthrough open.

The ioctl can already fail for many reasons such as MAX_STACK_DEPTH on
procfs as the commit message says, so server needs to cope with the
fall back.

Thanks,
Amir.
