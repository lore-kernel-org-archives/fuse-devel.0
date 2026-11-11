Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794387748;
	b=jk+mVxVkw6UXtxtlJfACOVIewmawOffw9GXGZ1ywuBjB6tLZF+U+gDsZ7T1bbCnnRSEs
	 /WIW1OdzRC4fC5TTrbKlwcdYzaxst9nYsFzdJ1FcyZnRujFK/ILRcfsF0w0e6RtLktmy6
	 KCgckIX1+F2IRyDD6LyHy054LfHcC0pIyMx2p/GKNVCpuuT59vyRS/Fb6zx3Bcqz0rcPa
	 WXwRV2TqWM60DzN5uNnshpFlp2DFgD10bDMWTU6B96Nhh6LFQgZOFeDU8DedFqaG/OoXY
	 ohzeBTiJho8nbv3xbCsA31k6Q6DHnOSSRdU67AnObC3sF82eibS8IrdiR88wlcupGNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
	b=Qai7u2KEPiA2hvSZTGzNtWFm/0gK4Cm3F3UCLUkUnQ5YxLs6tfx6op8qV9zjT4s/nSSh
	 EZ+GO5wZEoGXSjr14hgBSGljDdUQ1/QC6GRCgxyqXlz/qtsJ9rTKtQrLb+bVgaPwa8Rp6
	 L0rzaiUfNS0jxVJ+1qccDbVM5ruocPhsCSvONxJbKACBoK+B7HtWqqXuiGOPv/xt89+nf
	 HmJmLMfxF5leQnqDmtoQAaD9QQY56Qb/DcMkPbMeVWTiG1p5N9gHE+l3M57IyrvH4W7qG
	 nRMHoSukYatOFuSv5wRJgcB2CDkVS8X6jVOPvg18r7Ylj3zIFFPobA5sCU/SzM0y/aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=PMP3hDb6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B7606A32D
	for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=PMP3hDb6
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-54f873cbe2aso29821031cf.0
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 01:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794387746; cv=none;
        d=google.com; s=arc-20260327;
        b=e/OueiHKEE30Hd2MpwRUe4QRezAI85OyTBUfaInqiV7CrseWHdULq0y4KDtd7znpTb
         GIrBnktmAoVfD4gXTWiV+DHDyQMbJjXWKHDAjKLq2TZCZ4AFBAEQHjqv8O5VqDZEiJcr
         4Hy6FpI1xQmw7fYAo21iBTp83qIjRhz39VnCU1H44aHJiDp5DO8XWtZbQdPH++XywTEe
         DstLzlXltsgnMQ1rJyeJxkqqIxFZET+pwiyNs9YKMLvWP5tGFmhWFg3JVl6tjjdFDypV
         p4UdxEQHFII1Oq6Dmxsi4BGKFl5JMICHzBuoQ9LIzKLuqsFiLyTSRd11jx1zAx8wW1cb
         K4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
        fh=+kFE1lVDF6o4UON60RBHFHsjscJl+lCZgJTihGIbQlE=;
        b=WGooi6r2wYlLT81OXNlMRzedUE0HPg90A4JvWhtJCIouTkYS4yZ/w0iEeXImzuSa6d
         p12nE8/EnuDQ6bHGWKpZYXcvJwrbpPTkHgM64ecZVmRGvqQgnKV952wX6C0TJ/dd3IbO
         yolhls0B56k2YHB0U1CaSJMacalvePG2V1aWKpF+vGYPpUL1Yu10+PKHbKjsDzWSOW5z
         8vnxKnmfWOvPlwXqqd9G+EQVf7hHEbkM7HQZ3KlZBDw+GR6vozoNhVhv9S7FVUWb+R2/
         f0gfkue4/brSqoPSYladys1I1I33bJWOqm6dcPrihYjopr0Iu0kLLpLscmOQwZyKy0FY
         ietg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794387746; x=1794992546; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
        b=PMP3hDb6K0ZCHB8aQ6gd8JYjmIlSYa3E4dVPX3CxEkxVBVxLTjjvPK3ZRjSFQyxfS1
         laqa0N/t2JbbfLviY3DcqyvEZ2w5lrmjNnS+tQPbFxrxOg9eyV23NaImLy3DVPThs5aG
         7p8bpfoQpDiY0qdoaLWR9/7NzeQWLY6QwB/jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387746; x=1794992546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
        b=yPw0IE2Fgz6RJ+mAZkhDe4fritNJV+X1Tx85MYfQsIz43QRmSVGglM49rDjA/y9/K5
         HSSTkwT4bcYXaJyj3zHlJQL0lf6Ff2Oc/KFgZRCk3mJPW4pS2g1o7d6y3QeCXqm26G1o
         gY03Q7aZ1tc44RewNR4wF8PEKooxkLWRbq+NOz3z+wUpcgl7rUSU1SV20B/Gp9D4fWct
         +4r6cnZD9LVAsuICFgO0MTi8XAIcOjfyivMLUqoaUzvfEo/Urpj7eMUAP43eKZ+je+4n
         TqZ9elRp6ly/PCWXpy+SvaAYqrW2TFvzaJyfFpWui/6COc4rz2bIOrH05KxJE185MqI4
         T4Kw==
X-Forwarded-Encrypted: i=1; AL+hErGYWLsVgKVFtbB6VX5LZCs8ImXGA5WCn8/L7BUljWtT10Fa/BRR2MJWr1jV9QXF4/q0cZTZRuCEio8w@lists.linux.dev
X-Gm-Message-State: APuU4Z/zb0b/pFsR30QbmjnT4/waU8yce7agweJo6cYWzu3eeuTCO3eD
	S9NTKD8Dlh+V6PUynlMTtO5qvng4heuN6YbwyjSLvA9gvfPKzglTHjLTL3EQdA9eps5AEBCY+JE
	G4Si462EDIpFy8/7N6ahk34WOcHmTKh06SCEQjtG+VSk8w8qg0BrC6Nw=
X-Gm-Gg: AYBFou2HxFSCY6Kxc1ncIV4tqJAD05SFul0HFDCEGjEh4XwvRnNFU6F2E490RwAxahB
	GxbTzypiLryWV8/T7p+eKcK+CsbfCwclombDiKfU0gmbs4AOH7se505spcpwEwtQTsRvrXmQ+Lm
	84Yw4k6pn8U+cTov2Vy/3GxPIdx831dsfPHFO1bO8TRVzrDb73c+0O/kZHN2iCPj09PmqfLnFkp
	5s5wLNHBkbT4lIg9+t7Ez6y21aQ+yzicHUyYaIIuK6FO2ymtOxHEQNVxynAd2vLtdZcJBpnEUMy
	ZnbcqrIRuBE2ttLKQ3eB48IFEaXtNVQIChC0YgpRs1BkDLHgIh6I9/MnxsL+4EWrshFmWBbB5tL
	lnIlHuPs3uC0aP1tX+vtXZnjzjU4Qj3F7h08LuWS2lTcrgiriwJWCEcQoAg2YptSwDA==
X-Received: by 2002:a05:622a:34d:b0:536:8f5a:64a with SMTP id
 d75a77b69052e-556c222b82bmr24946931cf.63.1794387746372; Wed, 11 Nov 2026
 01:02:26 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-3-kas@kernel.org>
In-Reply-To: <20261110145241.536019-3-kas@kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 11 Nov 2026 10:02:15 +0100
X-Gm-Features: AclHuK9XqiIqd0G6zWinytDup_EFg0rRz4_cn9sSXLX9jTiH3KRFdGlFPrXk02Q
Message-ID: <CAJfpegvEeGN073FbaCRnhMeX8RHrckSxmFjkpdoyea2EuRf+zg@mail.gmail.com>
Subject: Re: [PATCH 2/4] fuse: don't move pipe buffers into the page cache
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Amit Shah <amit@kernel.org>, Jan Kara <jack@suse.cz>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 15:53, Kiryl Shutsemau (Meta) <kas@kernel.org> wrote:
>
> A splice() into /dev/fuse with SPLICE_F_MOVE lets the reply to a read
> request steal full pages from the pipe.  Each stolen page replaces, in
> the fuse file's page cache, the folio that the request allocated.  The
> page can be a page cache folio of another file, a page written into the
> pipe, or a gifted user page.
>
> Always copy.  The server sees the same data, and the move was a hint
> that splice() never promised to honour.

Did some research and looks like this feature is not used by any major project.

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos
