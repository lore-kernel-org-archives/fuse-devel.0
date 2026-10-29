Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270467;
	b=vw8a9VRiinunGSbl4WHzKoM60eT9AOLhieqSxNMj3tzJExvMH6bCPC4NvQSgnTU30iq7
	 aAaVeCoQitvnOg/joC5f/kiVusvUGeOHfG9jS+zd9SpbuLkak5sK3C6Tr8Rv2+vKErh8I
	 z6kDNoZwhhmnY9UUrfP1/3YjJsVN9Uy3f9xCfbkwXDW/+tdEkMG3Euirl5HHV9GCOTepJ
	 wgJhxK4TiM9vpO/4epQHpnJwQ42d9tVxMwEyy6X9OBFZJ56zmtygv7Q0sfvWG4Hi0ydRR
	 PwhxLTq2uEWG7Zy3GgIM0hzFYRecbJ6/uOBxws1Z6H6EjIg0LEuRDer7FBWlE4/XLCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7YTm9ioo95Vo9gklY6fm7lji+ML3t3fOVUT2mwFWX0Q=;
	b=hxTndxictsR7d/ugxUnz2GdnT8nkMpDDfor2rzL0a6h+p7jXIJtkqIQFUhErGQU3c/7Z
	 XqtnWX3zVKjJGh80ND3kOMRpchs8sS0wHSJdRl1NTdDIJLOYi5nkvW7TkSbVuVF9Alk6d
	 8n2K5HP43Na++1cS+086TuBENRqM0rGufclClXJIja3r95juhCsPLUZc6MhJe4mHU9j2C
	 c6IGyr2DfDXV9NbG1EKy20gYt3n3pP3qr7VG7f2bvcWDZKYRoyoBsk4/BMUy1eZC9JbKY
	 yUGzX3fswkN2Ix8XElPfgwnDiJtXkPYDcM6yaKz1LaoBEnqJ+/Gas12EVgaE91zAwwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUAO6pvX;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4C606A31D
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC4C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUAO6pvX
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1444926f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270465; x=1793875265; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YTm9ioo95Vo9gklY6fm7lji+ML3t3fOVUT2mwFWX0Q=;
        b=oUAO6pvXhkA4tjjRIU6HoZGra8hZeVym3WdSjW33k1YmuXG53mLOhhzwCVqFrFmx/p
         q3b5NDe1Q0NchENJdS3TpPTiOwtP5KjITD7uQ1zEd6igGRndm2snat9YNrpHQOGP60bK
         aLuRBQ8f4KqIYTjV2wUE66nGnOAS+ZSWNuKtPRSit1omIe4/AefscZ3PqE0FME7mQ0el
         9/XpHkbzOLJ1uymlizs6fTZabGu+2uJcflZSiMg2klL2CbFnDtLgD7rb0CIyIzeufg5x
         +1dFf5sDee8znxGWDoDyQdvoB4q775hy6rCjmC3OTfbCFPbaz2F7WVtJn9aNHa7zaSKW
         12aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270465; x=1793875265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YTm9ioo95Vo9gklY6fm7lji+ML3t3fOVUT2mwFWX0Q=;
        b=vXT701wH2zUpqGK5f6zuSJb7q2bXZckcyjeIAbg3GdwKQ17jiXTsXjFCs4gYTt/JBK
         kytnxLKqVg9H+0zwsPWL1oetPx/Zh11t0dErNIhqIpYh9PJEGtFrnOSp+ZmBHFMYX73I
         Lrr3Y7RM3uGfyPU9QLfxIQW6yPNYC4RpVeCrNiU27lxgnphUsaRxlwu0JQVs5ncXDjA9
         1d/SrUxDQovGAnt19rBo/FdoxMYNG6EvMLiYk+KZLQBQf3e3zLL7RjIwSJX2GJeysqh5
         UqDYvPYhOTkWqRRSkiUsuiTV+J5rxVspfcIl4HCiaqCKvGEGAy6n7JoZSqJ4+c+idvkX
         5Rvg==
X-Forwarded-Encrypted: i=1; AKwUvBxYSElaV606An1cp+PPAwtGH+krYw1EOl6IzvvCbNvalQ/P+vcr8g10e9Uemzl4Z3rTiRPLFxtT9lfP@lists.linux.dev
X-Gm-Message-State: AFq9FYKFQ1Cv5TDGviCOLZyhzKOl84dqhduZ8WyxwTIPnmdQF9gZEMRm
	ZqKU2nnkYDCC+nTggk/H3WohzFOT1VOl5OvxFDnu46yVDdCt4Do5mVYO
X-Gm-Gg: AYBFou1CAT0QR2ASz5Psb+a0KG+Dy3JVdukjdLvvxOMomm6CCPZwmMIONkkap5i9G0Z
	BXXaxjC939jKavxWa7M2MLRh1tKTkS3atMhXNBf24DXxB4PvDbrOp45vmLRX4fmaqjfni30t7Br
	T8wdLzMg5SslrRuqTI6ijOQnz1Dd1aWMTqLq/78ST1zRHgcD3gRDdxmT7/iXmQReNgoDr9taAal
	FczGEjRLQBvTcSpkeAo7BBstdq3zvTJdzKOeWK8y3a2DtgFRGLnIoCqCtKmq/fQqglpe+g7Zy1Y
	Zu9kC4L+T4L/qySosbVU9P72rz3MX57gTZn6kusSbwJDWzb/jlpe54su5lZXgdbQqTwI8f33uVE
	dRTVVt4NT0PN6WyNua9XC+7TGkKkMHyAqugOBP7aOtE086IyLe5N0Tba1GFNJsspkyMa+rnXQ/U
	q7w09crwro1i/e7KKbPmbYUSia8EXMLzYV3rfWqdAMZd6mxPUhNZ65jlfzitZcknoPBHs2Edrxg
	1wfDtcMnl45yPKYBjQ4eLwv9C5e7ycvRcfA64JKapC94mZxkvFgNE5/b3HL2bjhRos8fo33mkfr
	+A4R8xbGQb7iAV9XUeh8vtS/SdcVCouEU77zlgAwJeUtNnfiP6unXpsU8uOcj7IFf0d4aVOiP01
	Jv76Pj85nbuxQaGbk2zvDCS8WT3nT8bR4PHyFqIrZw1wPk21tiKFJN6HRWX2iOQg2WUOAUkeGlB
	SNUw==
X-Received: by 2002:a05:6000:29d6:b0:48c:5304:5e50 with SMTP id ffacd0b85a97d-48e5d331691mr7785077f8f.0.1793270465337;
        Thu, 29 Oct 2026 03:41:05 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm33467703f8f.31.2026.10.29.03.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:41:04 -0700 (PDT)
Message-ID: <a0a9ca65-a28d-4361-9813-99b584b9148f@gmail.com>
Date: Thu, 29 Oct 2026 10:41:06 +0000
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
Subject: Re: [PATCH v2 1/5] io_uring/rsrc: pass import flags to
 io_import_reg_buf()
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-2-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-2-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Give io_import_reg_buf() the import flags argument and drop the
> __io_import_reg_buf() variant, which only existed to pass them.
> 
> No functional change.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

