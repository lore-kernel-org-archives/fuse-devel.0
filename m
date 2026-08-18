Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB1539A7EF
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041615; cv=pass; b=NNrcAx8L3yngZ94OtERzhIt44y0w+gqqE+fWkK0Eg8AbXRP1+LIrBdhBNYHCwUd7LFmiEYk8y+1q4buPWBZGla8KBFtLTT/Jdv/mhKRn/L+x8PgmFWY9HLoacMQU/hDAwSf1W/AHapdGgSXZsJrEy0yDRecq8DdNwNgYsfwg5Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041615; c=relaxed/simple;
	bh=2Myb2+yqDeCxQ9gqAc47zhR9XON5EgteIQveOiiHKnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcEAVf8PUPYzmwfS/ymPrsDDU+sFKCdkaihleYnlf1xCVjqOwW14dfV3zxoYOyjNER4VCGnYhoHUcuWHeHwhjRoMKcxEqfzYtMADpMJvvtN2/7E9Usk9xP/S2wb13uom7MXBHJa1IZzzdY2CfMxjOauVCXqoAiwdeI4KabK+4q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=qc5vaNZU; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="qc5vaNZU"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52d8679c149so28356571cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 01:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787041612; cv=none;
        d=google.com; s=arc-20260327;
        b=s1/JeqhFlV/5arIG4E0KOXYGnOYtzleCQ/rqnBiw0qALoRFpxQdGz+nzu3T7XnRCJh
         FKzZZiz6SDvOTGfzuWGbrVmV5I708yXnFbK6FpArEuwKw71cI/ue6GM92zcxYnNsNSr1
         MFeWskWvKVLaOphMoBJugwfSxiXitAYPTNQ52z7pX2Lk8y03+x1OhB41EYxHDEmb1UkD
         6COlFtAMBfLrrX5sHwd9vBfG1TgC2tQZvujonjB+6Hels8jYfCx4bAXQi/kM68ItjCeQ
         cTi3L/s/XFs++pc4XqJqlyb0E4QMbx8PuEi5u7qN+6ELlHZbblecivrkyyfgaeM5lYvX
         zrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Li+5o8nckwjrY5g/MDrxhJ+cF+3KxPxI+CbcJDK1QtU=;
        fh=7wPk4WC+QK6wxnMs28sMOQ/2cfDT6d0KwhcO+ONFlwQ=;
        b=bTBtuYdQsj58NvthiHrFngRhyXBAUf42RY1EYhbP8Ejp6oFMdSiv7VPP2sJtzJqC44
         xsgDUhZ1wjjKnhioV7VZNdce6+mll3qgZBpOhJAUAKmJk8L4KCvBHDexXeDLunBJixHs
         mGKd8W9mcfs2t7Y0m/8TWl7xqKUSJ1tp3TuqZhaoznJGXO0FFpS+UxO9EstuQ/2CD7AJ
         Blnbs6Q4jYQqtNCX2wIpV7ULll+eZWyUN/dug+8bPKkc54DrXmsU3Tjtpf4yKtmn0mgC
         0Fbp44P6/xgDIrkz702EoojDNCqY3ujn7sD+X+pB+PuUoi6J17XnpfWCoR94P/lA7oHt
         w1Ug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787041612; x=1787646412; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Li+5o8nckwjrY5g/MDrxhJ+cF+3KxPxI+CbcJDK1QtU=;
        b=qc5vaNZUYksQ8WicuRIVJMA5R43fItPx+wQhpMFtoeqIXNDfhwfA5j5hk0NsIb5w34
         hppqCJdLxSUnenOi1QG7wtfTqewYA23mSqRVGqtMCIYmCHogyFv3+qLzpQV2cz2Xi+qR
         /61yiLT+ZfXqzYlUTnEGYxUBRxNmF0yMlNqF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041612; x=1787646412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Li+5o8nckwjrY5g/MDrxhJ+cF+3KxPxI+CbcJDK1QtU=;
        b=rFxNDPLMIxqylfrXr+//PMs+sya+z1UzMEk6wDOmiiqzfwXQZt8NfNRRx4NlEDZAj2
         1u8gU84KuoXFatBU21tv/S32lnbzPg+j2062rmwhLfL/6Zu1khO7dtk00YDNfP6AvSyt
         CdI2MDjtEe3iDR6vTxpH13vyH/9ejCFn6ak+D5GGmfhfnVqAqZRXIP2Qf2QmkB6Cp60D
         R85fptujDK5JtZRCdeQXvX1diyQYfZ8iGpkMSdwHFPz/JmnQBNZBJ8LNuB1L0oF/N8og
         SZ1xC4yOGBPmIruw/ma4QNAyRjQnOMw7Sfll/Jlw1R2SwNrofPsTPF8dBldawl80YKbR
         GrVA==
X-Gm-Message-State: AOJu0YzolqpLfdq60DCDIVM1AfFgWTBLM5esIB4qI8c0xxb19klPAZsZ
	kAL12+ovXv6BR0H9HHhWvxv7x9U5Gq7PDZBju7y/WX8Y8XwnqfJOymXYr8ss40979z71wz31N+z
	nkOveYex6HToreATlqj0XGMdgcFwbSFjYb/eejhr/0w==
X-Gm-Gg: AR+sD10oEZqUuSQvARTbssSp68AiRy9kULNoyf3q4C4VpCSc5QLZo/E2X9NsolaYlxj
	GYC8MJxIv5czz7JYnT4mI/LFSQocYaquBO0c+tWuVLsJv0IZOlDZ0MrRNgXJ1GMFzJ5nnBZdk8X
	Ja01MdH6n1EupIYTyVuXQY6IOJ2GJQiwC0pogH6UUTO/Sv1FaNGKhKUCaHeSP6wT5Or4du55HGJ
	FcJH2TZC4UbKMIPDvL1j1kdKClP6IoEtFevJUl2JctvJgrtOmqYzW3a5dAnA6oYVkVMDfpNz3bk
	bJT1tfY5m7gAxKUwRRfCy3J91cAkRSnI5TZRR4g6Rkqio7q6N3tBqUNZHVA2NsDRaMtrwzYFQ88
	O
X-Received: by 2002:a05:622a:1a88:b0:51c:51e:661c with SMTP id
 d75a77b69052e-52d8543f3c0mr324010091cf.25.1787041612031; Tue, 18 Aug 2026
 01:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817151801.2677899-1-libaokun@linux.alibaba.com>
In-Reply-To: <20260817151801.2677899-1-libaokun@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 10:26:40 +0200
X-Gm-Features: AcwNN1U-JaWd29eb1fwL1cQD3kcJieXaEWabirRkz-qqA_zZczUovgOLY9MN07I
Message-ID: <CAJfpegvRuBfDPY0-snNh-evEUWpNdUnD-RE5e42a6a3fo5MhdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fuse: fix invalidate lock leaks on DAX truncate error paths
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vgoyal@redhat.com, jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 17:18, Baokun Li <libaokun@linux.alibaba.com> wrote:
>
> Baokun Li (2):
>   fuse: fix invalidate lock leak on setattr writeback failure
>   fuse: fix invalidate lock leak on open O_TRUNC DAX failure

Applied, thanks.

Miklos
