Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565562;
	b=rHmd97yiCmZJlIncZb4KSzuMoyBSyfIfpnbzBitd4enoNCUPJpGB8cUTd9nKNVxhrR/5
	 tZn0l2wKcMBsA+V9lyM7OkK8NKUXsRzWyBvq71ai46+4HLSFVJqjSyOLrMcXMMslwhdjp
	 lKRRGj7WvQp2/gZ2o7DEi6XlZXj4nT/wlUMUoLlW+fHt/ZFl4/N7HIit5R38ca7jiwpSB
	 YtR4MUMTPJLui3/AtfUtS9gRmWY3el0feIe0augOjfG1iUwxx5ZmfC15JkhyMQRl33Ar/
	 Om0c4h9BgPfDmhn+Ctj0FixVfr2Fn0wwa0mdtOsqJTu+VbNPjajQyffeiydIosZy7Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
	b=mTrBlsYu/orbtLAfs4gVYEmzmMULTYQaOy+6GOO8orCFcbSQw4WawBccSDJXi0Fgl7cG
	 rQ/kBNepIcfCzHmNQAIKfbJ+3YBL1QZ8z04Fz1xx2E8uDh8M0F4UPXMrxZWPW+8GcdqnQ
	 1IAJKDjrmQhPGyljvCAVKBdtCMi/mnWOq9OzhAtRbOJoG/yQwNVhSfvjIOtWw37oR+Wq0
	 Ah3LQ0LtyJz2NtRijITE9kEStwgrSJ0W/eoUP27g7eWOmlZXwwKV1MgM7d2cfyINsGBhj
	 mKGAJ0+vkgbtAQz076Q+GBpC1RW+qKmsYJKEdglNl9MXGVzMD1+FrWMGIkZO5M0u+FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NKq7lQZB;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9411606A88A
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9411606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NKq7lQZB
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b80834ce1aso1170615e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565560; x=1795170360; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=NKq7lQZB3gGM0sLLYfuaugZJma8go/eKSMPykgYyCjF01TolC7bOUFBph2QfysOfyL
         vp5NvROZpjYewkD09tEtztgs/Bv948KTGCgFAFE8W9m9Tgh1o6kqs3VlpiYgXnoZFa1E
         6dOKrEmaHZUiMtoZoELRCbkOsaA5u3w5DAe9hrgrfIytB4mkbb7vof/aPry42XRjS2Ge
         Mx+YEdY1+gC7h5G8rcsMvEpUrdF6p/l2J7IOEy17IDREEYE+uoM7ZRrVwsF0plr4N9dV
         9QQD2tyAyye/Q4u4AyHVswy28OrFuzWzjCWEh+r5REeK2kKNplPJ66d2gj/3wUst4EE9
         IlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565560; x=1795170360;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=jWkWYYRzGirunRq43lHlpKhi3lf+FOuyqqEZRBcsJqfP4Zryw92UJjRFs12Gj4u8LA
         LbOOXfoy1hMTb3q7uiErJHZIlLgxcGg6z8VPFXRMzdGWI0nRYW4V0LWJRgpK2aymdD5U
         EuTWOpI1aU3yJ4A00eM8b+KVmPPzs0dtGaLZ/Ra61IZ2EXcxlDtDd3OYfwnZzYJRRWGF
         rG2BhTKYQUWLKYxPXrRB6jn/dL+7jm500SUGVHJZ3pv6WuEk59D5oDySPcFv5JbZTwqi
         l5H/wgAjXeZ5D9f7JzH+qWq4t6uNRTIGJQ4slLaevfS5Wu+xQuO6BpmN6+2mWdxynhsX
         2HjA==
X-Forwarded-Encrypted: i=1; AL+hErHVQJcGuHb3wUpV2L5XdfPyJEgO7BG3ni+ZltafEfAx6dpUbDFJg/lCHAor/kcmgouGy2Ry/Fbra+/8@lists.linux.dev
X-Gm-Message-State: APuU4Z87+u0EwTarXwncPT5kLrt/kOS33g082gj+g+LP9pHVZ3dVrbWK
	4EZeaj3OMJ06MIIs1r3iw7b2pqnjj+Fb1+phR38pfmPr685DhrLovPb7ZdpLezGqRJgK
X-Gm-Gg: AYBFou1KzGCNkDXSgef9fGO24oPjGRebUDP7jaStXlRfcFBPDMW9SD8PabbenXp9Zsm
	g+17M+y04e2jAE+vGs29jrD2jnmEuQ82rC72O94VnONk8uRq6W6OrzexWQB00CRgeDYwC9tP1z1
	ZN33Z3X++HhI/5MKUzzQFsUgLP55h3eCIZmfYxv5GN7ASjO6Sptw1y8gMNvdUuxQ5j9qvv0Bugd
	YFA7U1cKDs9OBEs8yN9N7qt8yXUI2DkNzOe3k0pwEpZZyKMbXiVxvGzuEp1U28FXCoGZ/l4efje
	CeqZ/ovo6SvrE0/z4YFQ27pme07/sFh7gtOvEoVyLXcTGLRAzdofwnX9HEwYAGX2UxGFJSb2csE
	ykr+vbYENz7eUYLRzLBPWt/rbmKdAVkqQsLzkVJrB72Gqi9FLSvPsCinSEt3jzmRHrlbmBCtekC
	amDAue0AM26AA/wHO2ysOxUWPtn0WyVVPLPazJGiGRhjlfGrR58ys9hSJceXsGLj7WYJvqv4jSp
	z9A/1bDf82Zflkfqi7jUxbjT/Zb6RQPt86v0odu0E9OL6Lt60po/3XHnVsImF+4cFyxcn1bSWbW
	FaYgXT/JEvRFtnkXmCVRi/BvHS0aOLtih1cIFpkP/nv4ISVkS6GvxY8XHW/4EAU=
X-Received: by 2002:a05:600c:4e49:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4bb55aa999dmr38995625e9.33.1794565560090;
        Fri, 13 Nov 2026 02:26:00 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm244439965e9.1.2026.11.13.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:25:59 -0800 (PST)
Message-ID: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, Chris Mason
	 <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
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
Date: Fri, 13 Nov 2026 11:25:57 +0100
In-Reply-To: <20261111151202.GA11391@lst.de>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
	 <20261111151202.GA11391@lst.de>
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

Hi Christoph,

On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> I've seen setups where people use fuse to mediate access to sysfs
> sysfs in odd ways.=C2=A0 No idea if that's still around, but if so, this
> patch will break it.


Oh, that's painful. Do they use backing files for that?
It's a relatively new feature in FUSE...

Kind regards,
Alex
