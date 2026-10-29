Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270621;
	b=xjrzniRllLwd+fRXYzel/hRj3Fa2SNUpz5FlXNdi8hDMWPgxSLmW4jY7i8N62JT3QGIs
	 j7jDdhmMy9WQ0SHpAsTb9GaEGcw3dgf0/Ky0uGo/MCwJL+DVQ/SAB6FMeJG1mfIl36N+I
	 yW3qM364q5o66E0mxqbe0BlzYMhsWGHW3eOcIOM0jui9Y9llcvlanF6oKxJQhnoc9RxC7
	 8IESLFDKA+KpDWe5ScXFlJGDVvXrBBD8N5DjNS1pTLBRA7oadal4OKdm/CnXDBeDJ9E1h
	 6McCETRUr5483FxmnLeR41r8NAtlHU8lmcK4j0jGwbRjhkd9Dul8CAf5NAHgVBuF8Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6XOKkfJsefWjpOEYol68Fomb3WNK9nIfoprYMh5LhYo=;
	b=J5KTjdSpjo/4cTXMjseLkIt0ky+pQHRRwdcPalyKa4lu14Is9iJSCMN5HaG/zMgaLdPf
	 rSqm0+izSMYXm0Oodcx2bzZ+ppyoSL5hlqZg9oIZgYZl9cOYM8yhSUQ2i8LW+WrOgso6c
	 zGfKj2ztt8kp4bIVI/YIVQX9bCzI15AuVGPCf7WiimvrRN0n4AmsCkI8TKTJygU4F1W7z
	 yrar0X0wn85IZexia/ZeAbHdcEvhHis58dT5/qJ0VIApIEp1LWNOW+ds/LLUz3kNRF4cC
	 XPSwociYF9oL8nTYxG6J4JVlwi6HgZQQu2Sf3FnFYcSHdQV9u+NAmA0R40KGpjALfUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJiqOgDL;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E0606A31E
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJiqOgDL
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17489915e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270619; x=1793875419; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XOKkfJsefWjpOEYol68Fomb3WNK9nIfoprYMh5LhYo=;
        b=BJiqOgDLM8zpD0flWrBVvrsG1V0LjhU64ieg1UPgxB2ksLKfTvjNBwhVsmNt9A4Xn7
         v+q8fNbeYAIxElcIslIJoRwMZGqqmY5xRhZo9+0CD6s2lYjsTjdfq/OgDw1QEGXaU7Nt
         3ODBCFVCxSnzvLZiiuhU+voUVS6QNRoNbvb2TTKxgFES0tnhChjoqQeITCkqSHEMb7ip
         YHtPk8oed+rIDsX28gSQqwfW4fJ5PNSYVCIvEyqtDzR5DuiENnSNa98EAFFc1surUeFa
         BUm+iHgjo9UgHhDhgV/qyGOlewMoFjZNh9Cy7OVsuhlbGfhETOIPFOIDgTBev8ocSAAS
         GdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270619; x=1793875419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XOKkfJsefWjpOEYol68Fomb3WNK9nIfoprYMh5LhYo=;
        b=Zjb83zPegKzxGpp1rT98zbRJ868NwmbggodA1z2+8hg9LHyRh6jHcivt7AHqnRPQ11
         eBSAkdsH4Xa/RcxLCd2IibuLtsWKgpSpk0uuyvf45mD+PH+QbGSVv6KZe5PHsD/J8Jkn
         gEEd13XHvdohn8EFGk3KFpDl/clecD55ps7C+yw6J9JmRT9foaMnJYX7y9dACOFHTY7I
         PbQKP6dpz3kJLvbp19vqctM5q1t5cXUfF2i1OZ94iqp+pLXyZHlRQ6gD89a1pB7FRa1E
         bEys06XOpqYEqjPp0+Tq8jtlvnWOtldXQki9OGfWTcCJrX3SQfAyY5IaEUScIZmCJMua
         8kXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzVggjIAc2w32ZH32Wrixa6esQvAZ7ysCnHIVZL+A4o86WSEl/aEXyMWza6t9Dw+yDKdRLjRXTBud/@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+uhTH0kByTtSsmEs+PUItBNp0uTNLlVBTXaDxzyCVDe1eFsQZ
	zkM015CG/PmhMb1Gt7yOflmgMEVZqZzgUF3/gI8rh0EDS3plsEN+0wmx
X-Gm-Gg: AYBFou0pqjgzsj/Pd2lvj3d5zyunqA8S8mNGQFO+FgPGGryDG04XLMNgMq3AYBh7gas
	7sjcZjGSpf/B4WVpr2D6ygBL9MkvpilnD7D5IEM8mgly3dO2FbOprgelXvEe6zYUGUzAr3ORm7h
	jAeeLpQwlpXJa102/XrMuOUy1BtKfmws5zCIuMps4W9SmFIzi9TrZey48rqsuM9WYHW9tq07nCQ
	0X/3H97ufDiBu3RWqgcRaBxDjc413+nu/1wTQBNECwuPU+TGdWd7uEfCUi9QK9sbDEc1cu9hFdy
	Bf2T9BgP4v6FfxNmhDvbB6q/SK2UIoF1n5HY6s0ohcOItRbVgO4HF4cyHm4ya3444CjkZ+0oRzF
	1RhBHLi52sCgYEaPnQKPJrdg/JwYFWtiD7Q98x/1HB2LTFasbZ64057lf/hNohPl6+uqBJQ6pxB
	e4/LSuLE6acB2IvGlKaREyd1b4274ZRXgMmuGP520i/opNy2CFyfAoCxIbasQTmQ/Sq/GWdv4i5
	4QLPEYywDQwCFDBeIEw55z0XAyKPvGBQv8tGEGX7EYSb+aiP1Kg9Xp6Nv0PmlR5FKKdQ7XbDZoT
	HOyuSlxMqGw71b8wh8tKIdOYv8Hel7yOeKHeJjuFAHEbTzXtcGpVwO5T+GVOHJyFGCZoOkUP+Sf
	kXRxCv6Tp21pqJIgVUo7EAmlvuBwMutJbSq28fH6l96Uj7lnDFf5uRkYM1EVocPIVir+QoQcNzp
	ScDw==
X-Received: by 2002:a05:600c:34cc:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a963ffc267mr124682955e9.2.1793270618838;
        Thu, 29 Oct 2026 03:43:38 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f629d5fsm47165475e9.3.2026.10.29.03.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:43:38 -0700 (PDT)
Message-ID: <e6b98a2e-a9da-406e-8969-3eb73b6d71b5@gmail.com>
Date: Thu, 29 Oct 2026 10:43:39 +0000
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] io_uring/uring_cmd: add import flags to
 io_uring_cmd_import_fixed()
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-3-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-3-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Add an import flags argument to io_uring_cmd_import_fixed(), so callers
> can opt in to buffer types they support. No flags are defined yet, and
> all callers pass 0.
> 
> No functional change.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

