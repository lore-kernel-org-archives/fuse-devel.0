Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271567;
	b=43xiLfc3IYnuPvtotSN95+IrVc5Nj5zEQJboKNn63mXAg6oen9JWP2dYHXx3HQzhIK5a
	 emcRyhSgAMA6NsoGY2ZFbO2r+deoLAdntKPBlSAVwVb3+37YkWlx9htAE3D66JaN2chd/
	 4QAzC11ktJensKF5Ke6ymeZyoSH3DU/RdwSi370Y5JVGsedjpLOx9m33eak9cgCp8+VfG
	 xxetOi+wu4dwRt+G8rg8bS0jNzJzQw4ibkxLrc5MK/EkHoviE/BfJcOKciyS3khERV2mt
	 kesry3mqNg1V9UG3M98u5atpXooo5Y8StRj7nFpYYlhag+kV0JSuQH3H2oB5oskNeBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BjLzw1kM6LZTzUaUxJhqUTMufk3/F/G637drKyKaiJE=;
	b=J3VBjJ4Huixy5pSw2YmB7S9mhFR1vKqwMYcrOO+3v5RdGKkkoXT+MiyPEgB2FdHSEsjD
	 bzFY7SgSJjQ3/Do4BM3zi7PK49MbsYyCxJlzUfAbzpCNlKu+/WFvI884aoZIffYjfVhx4
	 z9JGOR4Rj3OYSws8Q5CDrGcqvIg7M7gt11n+Cibsi4WjPrNYPHhGtHHL61p1iOuFDyEG2
	 4lXmKW0lfp6RMDKb6FcEq8OUfPXA/QgS/ipbLwI/Ede/AmRE0FXlZlny+rbMKGLSxLCzG
	 HORSNDuZ+PeFEgP6ITQn2moRaGMGYL2DcYUJPQcrUxupJFCoiy1w9V4BWFOe4wTA2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzUidgW5;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D3D606A31E
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzUidgW5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so21169345e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271566; x=1793876366; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjLzw1kM6LZTzUaUxJhqUTMufk3/F/G637drKyKaiJE=;
        b=xzUidgW5WcKrRyneOnAnUvWuzCO71NXt4akBIISeM0tBEJh3zLQp8VnhPEGYSJGRvw
         lxIG7CLAVc0T7wA+WlnmmVwgf/suogUQT+LRRmImvKQqWTbBb5TFLrQoMFG1rwn/dHbw
         WJsdjdmK7D+XihkLFOtJoUvP/ELBp+Eru0r4qgqE1GBc4NvDR11AgiKsBMuAdX0F45Hh
         4hrcv9ylbdz859u7EXw92gQpqI7mv4SlefLrn3dTgMcfVH7zOZHr/KfHRuV9ZAu1cqee
         IG4PWKjxF4LykzcpKOI1/zW5yYoxq30ryCC7EVsTDEbdAPwO31HVX4ZtUHraTB9r0EJe
         wVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271566; x=1793876366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjLzw1kM6LZTzUaUxJhqUTMufk3/F/G637drKyKaiJE=;
        b=wJHDfHPkRVHsO/Vo5v+euQT0WVmX9KoAtnrOX/MNQ1wOoXKzWpoDgo5r9KFsgY0bwP
         jt62ufeD3VI7GGthICONJrYJz2V2xEm/3uiqkavgIvs5OpqTUA/NGpBcjFPNmpbTYpN3
         ZGdlS7yf110EWESO8z/uSSOXXa9iqeYmFfXXWTFCsUPjwfEtPDPdu/a/VWg2sPuFiS6w
         NPVKF00mSgURimocDK0eODMtdTQd84iYVErnGG3WrUET3sYZJyqw80AdjDymNY+UMykH
         4HiUY4FhpottMr9EHaQMmgVEz/u8VTNs/9ClCbNri+rMKJ7BXRwsxIJaOv8ZCEhDptt3
         av4w==
X-Forwarded-Encrypted: i=1; AKwUvBwSYWdKRsyRLSiSXZCGzo/tCNSS4KBcW0KP6GyXpWX5bnKiJ8Xs+55qjzoSRO9v6TOMeHdgK9L5ecPu@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5B7Vpwd69Z+x/6yEagHnP6zL4pcpFeW/DP8YS2F6uaqadbKda
	4ALCL/Qxkid63OObynrXcLh2iXt+/L2AAONlO4ODyULOk8L2aKjAIket
X-Gm-Gg: AYBFou2uirlTXV/X0aJjXRftLEuWFwT6jTNqcShpCkyErF6u2RPZAVFa3JtbXoeobyG
	UK1l2FmO2iFuw/QS1I+7UB8xb0yakEF9DR9sYfpuV2Uo7i9X96TnVaZGHSwD0qrAjsPOeJA1I42
	arsAvNKCpFw2+I2WJlelk/SJThrIzPDduDvLRDzFYWk9A3wY86FZIwCnR1jL8ZqA7BC5/7heP/M
	m0n3B70ylBQvjhXYgUSTXYopMNJvGVijbs7ujpnvgW1SAe3+dKDgsJdw8ksDPywgxND+0sZNHO+
	X8FEGAKXbeOTuZUhw2lnw9nhy7peTkKO2efeaZfNsEM2TH6dr/SIgov2+fXfSCM0HSot2LqXpNh
	SbinwyYv8eBfifoYGbV5JWA1v4IBcGufo/DPKdXXC8iHmlWxJorbDa5rTDBi+7klpKW2KpRti7j
	tnneguAO2MDmIh4WBQlKrUfoHpIuFS9gmbIBVjFVfxVJhZuuElvy8DbRyXEFKmsIOP4hAlbzLx0
	K1ifvTxmnMuSF1zH+RUiVK7ufFFac8v2WjVpCv0ybz3VNaYkXDeNnb1x3t/sdJPeOkO1fLznLPp
	OE8iYp+Ci5sbJrJKQ1gaAgN9dJHaZ4OSa+TOs/yH17FJs4G5/25Uuv91W5Tz3uVBb0kZXSiyxz6
	AKhi2pMCcVLzVyB/mnpauOQhgXtlECdYyNJ8apK6gTqdOD4OToWqaOTpfyIMMlPeJNobPXU+uCP
	AfyA==
X-Received: by 2002:a05:600c:4f89:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a966c41836mr125002085e9.19.1793271565710;
        Thu, 29 Oct 2026 03:59:25 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7ee575e2sm58301065e9.1.2026.10.29.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:59:25 -0700 (PDT)
Message-ID: <c4acc3b3-be8c-49c6-b1ec-b25431d28d8d@gmail.com>
Date: Thu, 29 Oct 2026 10:59:26 +0000
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
Subject: Re: [PATCH v2 3/5] io_uring/uring_cmd: support dma-buf registered
 buffers
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-4-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-4-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Let callers of io_uring_cmd_import_fixed() opt in to dma-buf registered
> buffers with IO_URING_CMD_IMPORT_DMABUF, and attach the current map on
> import.
> 
> The map has to be dropped at hardware completion rather than from
> task_work. Add io_uring_cmd_hw_done() for drivers to call from end_io,
> which drops the map and queues task_work, and warn if task_work is
> queued with a map still attached.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

