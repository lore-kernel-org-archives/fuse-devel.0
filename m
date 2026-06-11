Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E5F31E835
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161609; cv=pass; b=ozef4JP+jXhrBWJfzIQ0pXLnOoCyv4nYhB/QbL7q9MhZuWC6NEIrdGtnJ7AWHnj9aHS9R/mmnKYd3atbkKOV6C50i8fBEISqOoccjsSByA101CpZXB1G7RL+SPOOWjPCxaT0DA99lvNKRVcD0TrLLdL1WVvZAOqXERblD8GNNBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161609; c=relaxed/simple;
	bh=VwX2Mc8g6EPyrXEFeEa8PhnM6S5CW8j+mFuSHXMJlj8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HznkK2qLwLkpp8q1kUSVUyqsIZX9wo/vxecFyZqHP0eu69mH66azuVv+wvXwlhH6xqZFKIEw20iCw+XID2mNkQ4ln68ovNuG5CqgNYkA1Rjj+l32xom/uL7nKkiKMJwSVtxutsjArITBKp61X2j+WDrlRY/xMsVdwKmdwaHwVdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=LuLZJmpr; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="LuLZJmpr"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-915aa0a9293so77064185a.1
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 00:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781161606; cv=none;
        d=google.com; s=arc-20240605;
        b=fEfLDVT44MCrqxIkvr7VPqBbzfxtJh44GPmLqxkdfio5EAtzG4egDyyrP7gFqpU2D1
         dMWDqFbqdUCDMC53xpYUvthzpPFIGBrK/YerPGSE2WZrlgO7dsYKbsYSFk5uwS6tG1YV
         wcifVST88zg/JaSs5c9whQyk7aLFGSfe2WoB2/5obn6HXX2Vx/d23QhTo8VXnhIwvsac
         PhStV53GKMV6V6uSzukx101iJcvKJM5Q8srSXJo+pfhaEp7FGyawRWk5fVLOGpXkQJCv
         bBceAPutLWlhElUDT7BL0Lg4HGa3PUi7YgRqlO+jEdw9Qv0PBrWjy6K4TE0PU7hLbjhS
         IwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VwX2Mc8g6EPyrXEFeEa8PhnM6S5CW8j+mFuSHXMJlj8=;
        fh=NiiyimkeorVliyqlSEqXmKg4q8zVwY4o7ktYV3mPgfA=;
        b=g87bpZ6YYorvZQ32Ujrm4D7ZaVF88oWWBUUaOXKvTjR9o06Ch397p8vtR0GXCuGR5j
         SXWBNsCwSiLnIuetbSWhHz59IinA0rcrpf+hjpRsX0hWZxU5QJtfGOatDsrJniKyArs4
         GK/iVzeAU2H6BzlKInPkAn0VJlHul1RDdwZxpOwrWr0AeB/+c+jo8S2OGK22lA8LcJu6
         qUwyN/40osmv4+LHnugliDQc3hYOPI/CJz9gpcsbcVywkXXJ7Wk45HWiqGYuZo6+u/+h
         2iGKv6fMsCw3KryODWNcY/mS1tskrIYKjyi7+rHpnO1qhqRZNYHzzF0BDGMe9x9uXh91
         Hb4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781161606; x=1781766406; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VwX2Mc8g6EPyrXEFeEa8PhnM6S5CW8j+mFuSHXMJlj8=;
        b=LuLZJmprdhdTXnSbmtsrmyvFZWNOAQjdZZ0jfjM+BaMzC6+yvNwOMG7BTG1reQe728
         2Gs1/fxEU3mzsmmMGauIkRoTA42uibsnsVQJkBsrX5BL8QKSWBNcmgXAdmVHpwObFgJq
         g19ohJKJDDleOSZHiNPrhv371Vv5qYb0HBBuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161606; x=1781766406;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwX2Mc8g6EPyrXEFeEa8PhnM6S5CW8j+mFuSHXMJlj8=;
        b=UWtLnOorfBI72cRAtjx7fw9ZXqUjh0HDcMF1Hmr3e0+AaujRBjWkIe7kUx9sdKk8di
         xpSG3fHRVjX/PBou3SKyi1awRGTrriFjOC/rlj6rtk3fXvZgHQi9DvpRY5/RGDCERl7x
         Qtg1pLzMHGhOrJOMpXSnjROdvSHjYIuGE5YfUrwGQ7GvFql2e5GTFeu5W+FIQ6D3+2AC
         LHleSK/BG1rbKlocTSvpaDKFuR+LyrSmlA3D1II6Xqkci3SUu+b5du49YW6dJMLAPNJm
         TsceRXlkJBYgiVO7cNM9Zufv2dWxq/ZfnYPoPs9wZoW+wbp+y1XNvsbSr6mS+6P1oaVv
         TekQ==
X-Gm-Message-State: AOJu0YwPHwkMJ39lkQguMD4Hy8sFeXJeOnWjl68w5zqUBWcSDPewRHD2
	bcE+N8T+O0beVQ1PKDTJdzrhXAsb1FhmPy4feR6HLmq07vU/eShFeSnGAgTJ0xI/O24ewJRixTM
	AkqwFij9j6LXv9aGNk6G8jInVnejDyg06xzXmbMi4KYG77hBXx5uHimjbfA==
X-Gm-Gg: Acq92OFrPaPNOeuZ3/6/YPcy8ZhNwdtrsQWInO1kgbu+ymo4k61NQxaaKCujbqE9ELG
	PwisE7Ta2jLztd5ywKXWOGX5QgBqWvS2mvAzI4JXY7UnkyvQYwHiLx22vCsAovO7/grxYxYY8Qd
	KVyIXKYK5BFiuJFZ/yuPvjjuLPU9tq/rVYUyjW5K+vt2HysV992+BYIrINZKGRGuUFFWPi4NecZ
	BENigjMH/ktJx+dhslgNjgkosDbFGp8vC2juTAkZfLIwOgGHsOuF3LGujSl15tChlMOItyimC1i
	d1hxnEhKnsr2sWDKxWPRnWClpMhGFqaM6plriLcqXpQVT6JZ1GY=
X-Received: by 2002:a05:622a:4c86:b0:517:c672:d43c with SMTP id
 d75a77b69052e-517ef67e9b2mr14457231cf.26.1781161606204; Thu, 11 Jun 2026
 00:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Jun 2026 09:06:35 +0200
X-Gm-Features: AVVi8CfJx4_bUyaxFqE93Z1R4bJ1L3hkiynop1Wzq1bskxObwrEf-gsf20QEtQ0
Message-ID: <CAJfpeguQ-_P2LUaVCics6Pyba+bde-KJYJ=Ori7Oqyv0V3O9fg@mail.gmail.com>
Subject: sashiko review on fuse-devel
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Roman,

Could you please add <fuse-devel@lists.linux.dev> to sashiko?

Thanks,
Miklos
