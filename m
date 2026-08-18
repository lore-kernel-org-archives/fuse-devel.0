Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABAA476CEC
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059280; cv=pass; b=jekKDbmnOhzAjGSA1Lx96Wq5WaRp4XkQveduxE/CqMpMdh3+9zB20sluE7KWlyKS+NB2IUipiZKQb8pqIWqXtv/EYhjptIQjM4LSJXmNmI5++smkNo/6MqHSdeJRknWt6hYRNjgpAdeCPa2ismpFpl7BforDEPam9QNCtfoB3rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059280; c=relaxed/simple;
	bh=/VGZXZCepoNJgIgzmkwudDmncCfY9xJyxQCJ2G13L/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDE5KwTkgXtdq3SkLUeV51Wy/C/nrbfzgViAiXl3AvEggrTvkdCZdGddTHsBMUsmn0g/tn242OwWIs6TY+8Sh9Gs1/jDwHACKbVw6SVJ1emIXnnt1+wF8oNTWt6hj1sCOxoKSBBx9PzBaiEfnw3/bcw5kt/iDzsg64xj2OQWFNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=UDBbfCdl; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="UDBbfCdl"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e6a434cabso223517085a.1
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 06:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787059278; cv=none;
        d=google.com; s=arc-20260327;
        b=nng/2p3dkey0wvnLCC9tHlBe23oBzBGkt8Xuw0uu5gEhCwTD0dOSscLe9dkV+JiW3n
         FGZHqtROIKhKwYATQcCf/cx3iut4f+r5dwXIH39d9cC/1s5mXYmhT/RTr/Qw5lGhKiwd
         8GpzuD64dPYp40bCLhjMOPJK0y3XEO2RJ8EN/i0sd7kVtAg6b96WqMEa5DAj7zk0eV4x
         K3/l4zREkJJX7qv51ej2zmGj6cglPjZs/ycqOSb416/bWqU56ucAWQZoSxr/t7Qe635e
         F10wUrYIEIt+hp4DF1kHU2W1eGb2e+/lGpGVuRw4hHb2yDkrBXkVhIZQs9huzSag63MT
         +upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/VGZXZCepoNJgIgzmkwudDmncCfY9xJyxQCJ2G13L/U=;
        fh=Daxy3zhO+W+L8cuaHBXEAyIG7ftX6C09jlhPgXWz+OA=;
        b=qIdhV93fPK7zNi1mSJrMSBxBdR7VUYBTs6jKPITaaR2CXqJyLFRyqPiLcocaeSIQhy
         i0Wnwdz2cn5yHzjXGYSA8YYBfNCzH93dNqJ7wY9TCKS33bRTfJCvQ9GBXl5Qpa9/16ZG
         dBGLLuCszvh0zKJnqFI/RjMSyBCwjmg23SIRf1fcRKnUqUfBPFEauM+ymWnApTOxrXBn
         KFBejSFezdh4C9RSHCp+mww7ZuLFC0YZsCB4GQvSGkbuUCUBYowgt7lbGr7og255AZbK
         wSanZuEhH18H2s8haAK2z1WlVylg9jtWKFhYrQZJjG5xn2q756+dlLEoy4scCGsgUyo5
         YkOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787059278; x=1787664078; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/VGZXZCepoNJgIgzmkwudDmncCfY9xJyxQCJ2G13L/U=;
        b=UDBbfCdluPY0IldcMscb1OtRQrNW9f9Mtuk/izWfbkrrRBnq42On2jxzBmwPFu85+r
         nARkA5LimNH53sU/7q96YSfzrk9f5apO5IxoBXUr6gLxzxNV6AoGdBIpaP2u8BFZhibk
         /zgTkNWPswMi1wms6RsZCQ09n/eCZV+TlEbAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787059278; x=1787664078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/VGZXZCepoNJgIgzmkwudDmncCfY9xJyxQCJ2G13L/U=;
        b=V+FlEX9BQwcueLkeT3l8SEvGIwHXZW2yic+cnmZfL+asRc+ANJu05aMLmthQBSeOLS
         Oq9KvmwcDZGDVg1gzgU6PY6HFwtffGEbulPNcMd5eTiduEQzoe8mCapEJ7qyOGZkXpuv
         cWwuBlFcsnRFhtravnz6yPmndeVD8uo0cltf93RtQi1eGmrwsQWgz7KvkyDCVjPZaQky
         l8uZHF/Uj0GaaUSaapbv9gCiPzKGWg6w63Gwn3t73O5qvVURFNIch13l34tWw/mJgO+T
         SyMUBme+D9yJOdPLrRMdVeem1wDRbNyTZNHliRngh/xec5GQEcJBRDrW1Wss8ydvI/EM
         +cXw==
X-Gm-Message-State: AOJu0YyMvSbxMH6/CJEzNLkMCdmsaiE2UieIE1hXmgVy5kOulWbkavs3
	QC/Q3lEIwYhZt5ZxWpqVDP1qxQ6pPdNiRGHA/Lad3BfCL6ejsbhqyOO8imhNpT46xTEHrteapPz
	Y+ne0Him1cDqo0xS1MeNSEJ3UkmbMufeCyb/JboncIA==
X-Gm-Gg: AR+sD13XO1JX60Q9ushDsUDg2WctgLWNJvmclkqMFqzNDQpweRtb2or4RVzNI+PzJ9o
	cC55UDeh+y89ff9v3NIzwn1bFg+KvbJzcYJm+Lg/JYBKrPAUYRNzgDbYv5Zm7A7FGUNNVUHXchA
	mq7UZapAYV8zUKtGRlIMEvUcRCMNsforMHBL8cCTypx12SJNAZ1bQwFu72Yh8e5Vs7VGYSEoUhD
	lgHQiBY6JQ3pIYw1qcN9V0OjidSrt9Os3QrfWNiY3AMYKWkvi9GeUum0ITSdUBKOfdt6meIVUD2
	LZPC4PwxbwYXfSavwRqE74Ym6QbJs+GjqCRRaNxxtiEH5JRYQGEdsI5gPhaKbalzChzuiAsHaVP
	e
X-Received: by 2002:a05:620a:8812:b0:936:d2a2:5fe with SMTP id
 af79cd13be357-936d2a24ffemr3460347985a.6.1787059277777; Tue, 18 Aug 2026
 06:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260801082451.2770813-1-libaokun@linux.alibaba.com>
In-Reply-To: <20260801082451.2770813-1-libaokun@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 15:21:06 +0200
X-Gm-Features: AcwNN1Uq2AZxWWAiZ2GeI7i2pIbWFCmY8WBUYjcETCkru1nzDswcXixjBLbPfCQ
Message-ID: <CAJfpegujSRfGBgVLj3k2Z8uhVYi_mSyZVhSO_9vtOTkyNn49Ew@mail.gmail.com>
Subject: Re: [PATCH] fuse: wake one waiter per freed slot when raising max_background
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Aug 2026 at 10:25, Baokun Li <libaokun@linux.alibaba.com> wrote:

> Use wake_up_nr() with the number of slots that just became available.
> Since the wakeup is guarded by !fch->blocked, num_background is
> strictly below max_background, so the count is at least 1 and never
> degenerates into wake_up_all().

Applied, thanks.

Miklos
